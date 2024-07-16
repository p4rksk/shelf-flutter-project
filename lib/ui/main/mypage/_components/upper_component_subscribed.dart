import 'package:flutter/material.dart';
import 'package:shelf/data/globals/avatar.dart';
import 'package:shelf/data/model/user/user.dart';
import 'package:shelf/ui/main/mypage/_components/logout_button.dart';
import 'package:shelf/ui/main/mypage/_components/next_purchase.dart';
import 'package:shelf/ui/main/mypage/_components/sub_period.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/move.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';
import 'package:shelf/ui/main/mypage/pages/payment_management_page.dart';

class UpperComponentSubscribed extends StatelessWidget {
  final User? user;

  UpperComponentSubscribed({
    this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(getAvatarPath(user!.avatar)),
                ),
              ),
              SizedBox(height: 50, width: 5),
              Text(
                '${user!.nickName} 님',
                style: h6(),
              ),
              Spacer(), // 남은 공간을 채워서 로그아웃 버튼을 오른쪽 끝으로 밀기
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
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Move.paymentManagementPage);
                  },
                  child: Container(
                    width: double.infinity,
                    height: gap_xxl,
                    decoration: BoxDecoration(
                      color: kAccentColor7,
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
                          Icon(Icons.arrow_forward_ios, color: Colors.white),
                        ],
                      ),
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
                              style: p3(),
                            ),
                            SizedBox(width: 5),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 2),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color(0xffe6e6e6), width: 1),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Text("전자책 구독",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 10)),
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
