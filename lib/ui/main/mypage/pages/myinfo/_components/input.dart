import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/constants.dart';

class Input extends StatelessWidget {
  final String? fieldname;
  final bool obscureText;
  final bool isChangable;

  const Input({
    required this.fieldname,
    this.obscureText = false,
    this.isChangable = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: fieldname,
        border: OutlineInputBorder(),
        suffixIcon: isChangable
            ? TextButton(
                onPressed: () {
                  // 버튼이 눌려졌을 때 동작 추가하기
                },
                child: Text(
                  '변경하기',
                  style: TextStyle(color: kAccentColor3),
                ),
              )
            : null,
      ),
    );
  }
}
