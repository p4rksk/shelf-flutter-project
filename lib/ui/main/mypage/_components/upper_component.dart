import 'package:flutter/material.dart';
import 'package:shelf/data/globals/avatar.dart';
import 'package:shelf/data/model/user/user.dart';
import 'package:shelf/ui/main/mypage/_components/logout_button.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import '../pages/payment_management_page.dart';
import '../pages/payment_web_view.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpperComponent extends StatefulWidget {
  final User? user;

  UpperComponent({required this.user});

  @override
  _UpperComponentState createState() => _UpperComponentState();
}

class _UpperComponentState extends State<UpperComponent> {
  Future<String> getAuthToken() async {
    try {
      final response = await http.post(
        Uri.parse('https://api.iamport.kr/users/getToken'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'imp_key': '8686240311585256', // PortOne API Key
          'imp_secret': 'jd1q3FIVZMmutISDQXfXWtfL9zViyNiGpNc3xIEzjWra1fjzNCRlNHrjscoHJQcpsB3vPa0U5hofZ7LE', // PortOne API Secret
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response']['access_token'];
      } else {
        print('Failed to get auth token: ${response.body}');
        throw Exception('Failed to get auth token');
      }
    } catch (e) {
      print('Exception in getAuthToken: $e');
      throw Exception('Failed to get auth token');
    }
  }

  Future<void> handleInitialPayment() async {
    try {
      String token = await getAuthToken();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentWebView(paymentData: {
            'merchant_uid': 'order_${DateTime.now().millisecondsSinceEpoch}', // 고객사 주문번호 (ex.order_1720595101178)
            'amount': 100, // 상품 금액
            'name': '[Shelf] 1개월 정기 결제', // 정기 결제 이름
            'customer_uid': 'customer_${DateTime.now().millisecondsSinceEpoch}', // 구매자의 결제 수단 식별 고유번호 (ex.customer_1720595101182)
            'pg': 'html5_inicis',
            'buyer_email': widget.user!.email,
            'token': token,
          }),
        ),
      ).then((result) {
        if (result == 'success') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('결제가 완료되었습니다.')),
          );
        }
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('결제 창 호출에 실패했습니다.')));
    }
  }

  Future<void> handleUnschedulePayment() async {
    try {
      final url = Uri.parse('http://10.0.2.2:8080/unschedule');

      final body = jsonEncode({
        'customer_id': 'customer_1720769064276'
      });

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        print('결제 해지 성공');
      } else {
        print('결제 해지 실패: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('결제 해지에 실패했습니다. 서버 응답: ${response.body}')),
        );
      }
    } catch (e) {
      print('결제 해지 요청 중 오류 발생: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('결제 해지 요청 중 오류가 발생했습니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: gap_m, vertical: gap_m),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: gap_s),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(getAvatarPath(widget.user!.avatar)),
                ),
              ),
              SizedBox(height: gap_xxxl, width: gap_s),
              Text(
                '${widget.user!.nickName} 님',
                style: h6(),
              ),
              Spacer(),
              LogoutButton(),
            ],
          ),
          SizedBox(height: gap_s),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: gap_xxl,
                  decoration: BoxDecoration(
                    color: Color(0xFFB48EEE),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentManagementPage(),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '나의 정기구독',
                            style: h8(),
                          ),
                          Icon(Icons.arrow_forward_ios, color: TColor.white),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SHELF의 정기구독을 시작하세요',
                        style: p3(),
                      ),
                      SizedBox(height: 5),
                      Text(
                        '어려운 독서, 시작하면 습관이 됩니다.',
                        style: plainText(),
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: handleInitialPayment,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                TColor.primaryColor1), // 버튼 배경 색상
                            foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(5.0), // 원하는 반경 값 설정
                              ),
                            ),
                          ),
                          child: Text('구독 하기'),
                        ),
                      ),
                      SizedBox(height: 5)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
