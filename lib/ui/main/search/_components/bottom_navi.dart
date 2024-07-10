import 'package:flutter/material.dart';

class ButtonNavi extends StatelessWidget {
  const ButtonNavi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white, // 배경색 설정
      selectedItemColor: Colors.black, // 선택된 아이템 색상 설정
      unselectedItemColor: Colors.black,
      showSelectedLabels: false, // 선택된 아이템 레이블 숨기기
      showUnselectedLabels: false, // 선택되지 않은 아이템 레이블 숨기기
      type: BottomNavigationBarType.fixed, // 고정된 타입 설정
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: '서치'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: '위시리스트'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '내정보'),
      ],
    );
  }
}