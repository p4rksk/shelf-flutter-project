import 'package:flutter/material.dart';

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
