import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  final String? selectedOption;
  final Function(String?) onOptionChanged;

  CustomDrawer({required this.selectedOption, required this.onOptionChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                crossAxisAlignment: CrossAxisAlignment.start, // 텍스트를 왼쪽 정렬
                children: [
                  Row(
                    children: [
                      Container(
                        child: SvgPicture.asset(
                          "assets/icon/system/filter_icon.svg",
                          width: 30,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '필터',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.filter_list),
              title: Text(
                'Sort By',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // 필터 옵션 1 동작 구현
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  buildRadioButton('가나나 순', 'nameSort'),
                  buildRadioButton('출판일 순', 'pubSort'),
                  buildRadioButton('스크랩 순', 'scrapSort'),
                ],
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.filter_list),
              title: Text(
                '평점순',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              onTap: () {
                // 필터 옵션 2 동작 구현
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioButton(String title, String value) {
    return ListTile(
      leading: Transform.scale(
        scale: 0.7, // 라디오 버튼 크기 조절
        child: Radio<String>(
          value: value,
          groupValue: selectedOption,
          onChanged: onOptionChanged,
        ),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
      visualDensity: VisualDensity(horizontal: -4.0, vertical: -4.0), // 밀도 조절
    );
  }
}
