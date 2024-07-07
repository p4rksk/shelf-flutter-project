import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/size.dart';

import '../../../_core/constants/constants.dart';

class GradientTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: TColor.primaryG,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}