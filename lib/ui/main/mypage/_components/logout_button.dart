import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: FilledButton(
        onPressed: () {
          // '구독 상품 살펴보기' 기능
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              CupertinoColors.systemGrey2), // 버튼 배경 색상
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
        child: Text('로그 아웃',
          style: TextStyle(
              fontWeight: FontWeight.w600
          ),),
      ),
    );
  }
}
