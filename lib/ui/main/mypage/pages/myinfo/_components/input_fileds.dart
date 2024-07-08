import 'package:flutter/material.dart';
import 'package:untitled/ui/main/mypage/pages/myinfo/_components/input.dart';

class InputFields extends StatelessWidget {
  const InputFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(height: 10),
          // Card Info
          Input(fieldname: "결제카드"),
          SizedBox(height: 16),
          Input(fieldname: "이메일"),
          SizedBox(height: 16),
          Input(fieldname: "비밀번호", obscureText: true),
          SizedBox(height: 16),
          Input(fieldname: "전화번호"),
          SizedBox(height: 16),
          Input(fieldname: "주소"),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
