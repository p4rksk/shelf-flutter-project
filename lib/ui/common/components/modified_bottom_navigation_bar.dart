import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/_core/constants/move.dart';

import '../../../_core/constants/constants.dart';

class ModifiedBottomNavigator extends StatelessWidget {
  final int selectedIndex;
  // final ValueChanged<int> onTap; // onTap 콜백 추가

  const ModifiedBottomNavigator({
    Key? key,
    required this.selectedIndex,
    // required this.onTap, // onTap 콜백을 필수로 추가
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: BottomNavigationBar(
          backgroundColor: kAccentColor2,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: TColor.white,
          unselectedItemColor: Colors.white54,
          onTap: (index) {
            // onTap(index); // 상태 업데이트 콜백 호출
            _onItemTapped(context, index);
          },
          showSelectedLabels: false, // 선택된 라벨 숨기기
          showUnselectedLabels: false, // 선택되지 않은 라벨 숨기기
          items: const [
            BottomNavigationBarItem(
                label: "홈", icon: Icon(FontAwesomeIcons.house)),
            BottomNavigationBarItem(
                label: "찾기", icon: Icon(FontAwesomeIcons.search)),
            BottomNavigationBarItem(
                label: "내서재", icon: Icon(FontAwesomeIcons.book)),
            BottomNavigationBarItem(
                label: "마이페이지", icon: Icon(FontAwesomeIcons.solidCircleUser)),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(BuildContext context, int index) {
    // <--- 여기서 경로에 따라 네비게이션을 변경
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, Move.homePage);
        break;
      case 1:
        Navigator.pushReplacementNamed(context, Move.searchPage);
        break;
      case 2:
        Navigator.pushReplacementNamed(context, Move.myShelfPage);
        break;
      case 3:
        Navigator.pushReplacementNamed(context, Move.myPage);
        break;
    }
  }
}
