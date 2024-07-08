import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/constants.dart';

class Input extends StatelessWidget {
  final String? fieldname;
  final bool obscureText;

  const Input({
    required this.fieldname,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: fieldname,
        border: OutlineInputBorder(),
        suffixIcon: TextButton(
          onPressed: () {
            // 버튼이 눌려졌을 때 동작 추가하기
          },
          child: Text(
            '변경하기',
            style: TextStyle(color: kAccentColor3),
          ),
        ),
      ),
    );
  }
}
