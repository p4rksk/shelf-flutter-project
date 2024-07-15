import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/constants.dart';

class SaveButton extends StatelessWidget {
  String? buttonName;

  SaveButton({
    this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: FilledButton(
        onPressed: () {
          // '구독 상품 살펴보기' 기능
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              TColor.primaryColor1), // 버튼 배경 색상
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0), // 원하는 반경 값 설정
            ),
          ),
        ),
        child: Text(
          buttonName!,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
