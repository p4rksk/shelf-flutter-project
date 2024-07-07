import 'package:flutter/material.dart';
import 'package:untitled/ui/startview/components/sign_in.dart';
import 'package:untitled/ui/startview/components/sign_up.dart';

class BottomSheetContent extends StatelessWidget {
  final String title;

  const BottomSheetContent({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title == '로그인' ? SignIn() : SignUp();
  }
}



