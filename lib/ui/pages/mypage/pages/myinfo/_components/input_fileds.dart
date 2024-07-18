import 'package:flutter/material.dart';
import 'package:shelf/ui/pages/mypage/pages/myinfo/_components/input.dart';

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
          Input(fieldname: "결제카드", isChangable: true),
          SizedBox(height: 16),
          Input(fieldname: "이메일"),
          SizedBox(height: 16),
          Input(fieldname: "비밀번호", isChangable: true, obscureText: true),
          SizedBox(height: 16),
          Input(fieldname: "전화번호", isChangable: true),
          SizedBox(height: 16),
          Input(fieldname: "주소", isChangable: true),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
