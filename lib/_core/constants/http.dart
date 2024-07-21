import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

// http 통신
// android 에뮬레이터에서 루트백주소는 10.0.2.2:8080
final baseURL = "http://192.168.219.115:8080";

final dio = Dio(
  BaseOptions(
    baseUrl: baseURL, // 내 IP 입력
    contentType: "application/json; charset=utf-8",
  ),
);

// 휴대폰 로컬에 파일로 저장
const secureStorage = FlutterSecureStorage();

String? globalAccessToken = null;
var logger = Logger();


// 인터셉터 생성
var interceptor = InterceptorsWrapper(
  onRequest: (options, handler) async {
    if (globalAccessToken != null) {
      options.headers["Authorization"] = "$globalAccessToken";
    } else {
      print("나 토큰이 없습니다.");
    }

    return handler.next(options);
  },
  onResponse: (response, handler) async {
    // logger.d(response.headers["Authorization"]);

    return handler.next(response);
  },
  onError: (error, handler) {
    //요청, 응답 오류일
    return handler.next(error);
  },
);
