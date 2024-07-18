import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';

class PaymentWebView extends StatefulWidget {
  final Map<String, dynamic> paymentData;

  PaymentWebView({required this.paymentData});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller = WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
            _controller.runJavaScript('''
                const IMP = window.IMP;
                IMP.init('imp86167246');
                IMP.request_pay({
                    pg: '${widget.paymentData['pg']}',
                    pay_method: 'card',
                    merchant_uid: '${widget.paymentData['merchant_uid']}',
                    name: '${widget.paymentData['name']}',
                    amount: ${widget.paymentData['amount']},
                    customer_uid: '${widget.paymentData['customer_uid']}', // 이후 정기 결제를 위해 필요
                    buyer_email: '${widget.paymentData['buyer_email']}',
                }, function(response) {
                    if (response.success) {
                        console.log('결제 성공: ' + JSON.stringify(response));
                      // 결제 성공 시 서버에 데이터 전송 (Fetch API 사용)
                      fetch('http://10.0.2.2:8080/pay', {
                          method: 'POST',
                          mode: 'cors',
                          headers: {
                              'Content-Type': 'application/json'
                          },
                          body: JSON.stringify(response)
                      })
                      .then(response => {
                          if (!response.ok) {
                              throw new Error('Network response was not ok ' + response.statusText);
                          }
                          return response.json();
                      })
                      .then(data => {
                          console.log('서버에 결제 데이터 저장 성공: ' + JSON.stringify(data));
                          Toaster.postMessage('결제 데이터 저장 성공');
                      })
                      .catch((error) => {
                          console.error('서버에 결제 데이터 저장 실패: ', error);
                          Toaster.postMessage('서버에 결제 데이터 저장 실패');
                      });
                      
                      Toaster.postMessage('결제 성공');
                    } else {
                        console.log('결제 실패: ' + JSON.stringify(response));
                        Toaster.postMessage('결제 실패: ' + response.error_msg);
                    }
                });
            ''');
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
            ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
          debugPrint(message.message);
          if (message.message == '결제 성공') {
            Navigator.pop(context, 'success'); // 메인 화면으로 돌아가고 결과 전달
          }
        },
      )
      ..loadRequest(Uri.dataFromString('''
      <!DOCTYPE html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <meta name="viewport" content="width=device-width, initial-scale=1.0">
          <title>결제 페이지</title>
          <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
          <script src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
      </head>
      <body>
      </body>
      </html>
      ''', mimeType: 'text/html', encoding: Encoding.getByName('utf-8')));

    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('결제 화면'),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
