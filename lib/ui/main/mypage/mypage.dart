import 'package:flutter/material.dart';
import 'package:untitled/ui/main/mypage/_components/logout_button.dart';
import 'package:untitled/ui/main/mypage/_components/lower_component.dart';

import '_components/upper_component.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            UpperComponent(name: '김성훈'),
            LowerComponent(),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
