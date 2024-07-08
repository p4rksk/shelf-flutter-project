import 'package:flutter/material.dart';

class SearchBarV2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: '검색어를 입력하세요',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
            ),
          ),
        ),
        SizedBox(width: 8.0),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              // 사이드 탭바로 필터 불러오기
            },
            child: Image.asset(
              "assets/icon/system/filter_icon.png",
              width: 35,
              height: 35,
            ),
          ),
        )
      ],
    );
  }
}
