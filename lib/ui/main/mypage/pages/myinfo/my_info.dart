import 'package:flutter/material.dart';
import 'package:untitled/ui/main/mypage/pages/myinfo/_components/input_fileds.dart';
import 'package:untitled/ui/main/mypage/pages/myinfo/_components/save_button.dart';
import 'package:untitled/ui/main/mypage/pages/myinfo/_components/user_icon.dart';

class MyInfo extends StatelessWidget {
  String? username;

  MyInfo(this.username);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 20),
            UserIcon(username: username),
            InputFields(),
            SaveButton(buttonName: "저장하기")
          ],
        ),
      ),
    );
  }
}
