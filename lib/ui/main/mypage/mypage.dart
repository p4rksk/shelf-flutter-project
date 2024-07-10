import 'package:flutter/material.dart';
import 'package:untitled/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:untitled/ui/main/mypage/_components/logout_button.dart';
import 'package:untitled/ui/main/mypage/_components/lower_component.dart';

import '_components/upper_component.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final int _selectedIndex = 0;

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
      bottomNavigationBar: ModifiedBottomNavigator(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
