import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/size.dart';
import '../../../../_core/constants/style.dart';

class UpperComponentSubscribed extends StatelessWidget {
  String? name;

  UpperComponentSubscribed({
    this.name,
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
                  backgroundImage: AssetImage("assets/icon/02.png"),
                ),
              ),
              SizedBox(height: 20, width: 5),
              Text(
                '${name} 님 구독상태',
                style: h6(),
              ),
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
                  color: CupertinoColors.systemGrey5,
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
                        Icon(Icons.arrow_forward_ios, color: TColor.grey),
                      ],
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
                      Row(
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
                            child: Text("전차책 구독",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 10)),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                '어려운 독서, 시작하면 습관이 됩니다.',
                                style: plainText(),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      SizedBox(
                        width: double.infinity,
                        child: FilledButton(
                          onPressed: () {
                            // '구독 상품 살펴보기' 기능
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                kAccentColor1), // 버튼 배경 색상
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
                          child: Text('구독 상품 살펴보기'),
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
