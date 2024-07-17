import 'package:flutter/material.dart';

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
              color: Color(0xffababab),
              fontSize: 15,
            ))
      ],
    );
  }
}
