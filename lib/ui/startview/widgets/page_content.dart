import 'package:flutter/material.dart';
import 'package:shelf/ui/startview/widgets/show_custom_bottom_sheet.dart';
import '../../../_core/constants/constants.dart';
import 'gradient_text_button.dart';

Widget PageContent(
    BuildContext context, {
      required String title,
      required String subtitle,
      required bool isChangeColor,
      bool showButtons = false,
      bool isGifPage = false, // Add a new parameter for GIF page
      bool showLogo = false, // Add a new parameter for showing logo
    }) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: isChangeColor
          ? LinearGradient(
        colors: TColor.primaryG,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )
          : null,
      color: !isChangeColor ? Colors.white : null,
    ),
    child: Center(
      child: isGifPage
          ? Image.asset(
        'assets/images/main.gif',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showLogo)
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
              ),
            ),
          Text(
            title,
            style: TextStyle(
              color: TColor.black,
              fontSize: 36,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              color: TColor.grey,
              fontSize: 18,
            ),
          ),
          if (showButtons) const SizedBox(height: 40),
          if (showButtons)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  GradientTextButton(
                    text: "로그인",
                    onPressed: () {
                      showCustomBottomSheet(context, "로그인");
                    },
                  ),
                  const SizedBox(height: 20),
                  GradientTextButton(
                    text: "회원가입",
                    onPressed: () {
                      showCustomBottomSheet(context, "회원가입");
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    ),
  );
}