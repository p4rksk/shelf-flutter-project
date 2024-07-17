import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shelf/ui/main/mypage/_components/menu.dart';
import '../pages/dark_mode_settings_page.dart';
import '../../../../_core/constants/move.dart';

class LowerComponent extends StatelessWidget {
  const LowerComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Text(
              "서비스 설정",
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, Move.profileEditPage);
            },
            child: Menu("내 정보 관리"),
          ),
          Menu("내 기기 관리"),
          Menu("알림 설정"),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DarkModeSettingsPage(),
                ),
              );
            },
            child: Menu("다크 모드 설정"),
          ),
        ],
      ),
    );
  }
}
