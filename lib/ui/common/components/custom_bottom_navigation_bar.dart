import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../_core/constants/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
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
          backgroundColor: kAccentColor4,
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: TColor.white,
          unselectedItemColor: Colors.white54,
          onTap: onItemSelected,
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
}
