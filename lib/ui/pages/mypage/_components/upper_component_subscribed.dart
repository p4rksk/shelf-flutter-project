import 'package:flutter/material.dart';
import 'package:shelf/data/globals/avatar.dart';
import 'package:shelf/data/model/user/user.dart';
import 'package:shelf/ui/pages/mypage/_components/logout_button.dart';
import 'package:shelf/ui/pages/mypage/_components/next_purchase.dart';
import 'package:shelf/ui/pages/mypage/_components/sub_period.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UpperComponentSubscribed extends StatefulWidget {
  User? user;

  UpperComponentSubscribed({
    this.user,
  });

  @override
  State<UpperComponentSubscribed> createState() =>
      _UpperComponentSubscribedState();
}

class _UpperComponentSubscribedState extends State<UpperComponentSubscribed> {

  Future<void> handleUnschedulePayment() async {
    if (widget.user?.id == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User ID가 null입니다. 유효한 ID를 제공해주세요.')),
      );
      return;
    }

    try {
      // 요청할 URL
      final url = Uri.parse('http://10.0.2.2:8080/app/unschedule');

      // 요청 본문 데이터
      final body = jsonEncode({
        'user_id': widget.user!.id
      });

      // POST 요청 보내기
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        // 성공 처리
        print('결제 해지 성공');
      } else {
        // 실패 처리
        print('결제 해지 실패: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('결제 해지에 실패했습니다. 서버 응답: ${response.body}')),
        );
      }
    } catch (e) {
      // 예외 처리
      print('결제 해지 요청 중 오류 발생: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('결제 해지 요청 중 오류가 발생했습니다.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage:
                      AssetImage(getAvatarPath(widget.user!.avatar)),
                ),
              ),
              SizedBox(height: 20, width: 5),
              Text(
                '${widget.user!.nickName} 님',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              LogoutButton(),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffe6e6e6)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: gap_xxl,
                  decoration: BoxDecoration(
                    color: Color(0xffa179da),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
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
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            Text(
                              '전자책 월 정기구독',
                            ),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffe6e6e6), width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text("전차책 구독",
                                  style: TextStyle(
                                      color: Color(0xffababab), fontSize: 10)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          SubPeriod(),
                          NextPurchase(),

                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: handleUnschedulePayment,
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
                          child: Text('구독 해지'),
                        ),
                      ),
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
