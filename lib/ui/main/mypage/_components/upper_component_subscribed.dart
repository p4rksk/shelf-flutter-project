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
                              child: Text("전차책 구독",
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

class SubPeriod extends StatelessWidget {
  const SubPeriod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          child: Text(
            '구독기간',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xffababab),
            ),
          ),
        ),
        Text("2024,06,21 ~ 2024.07.21",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ))
      ],
    );
  }
}

class NextPurchase extends StatelessWidget {
  const NextPurchase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 90,
          child: Text(
            '다음 결제일',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Color(0xffababab),
            ),
          ),
        ),
        Text("2024.07.21",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ))
      ],
    );
  }
}
