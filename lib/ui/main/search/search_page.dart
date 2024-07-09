import 'package:flutter/material.dart';
import 'package:untitled/ui/main/search/_components/author_buttons.dart';
import 'package:untitled/ui/main/search/_components/category_buttons.dart';
import 'package:untitled/ui/main/search/_components/custom_drawer.dart';
import 'package:untitled/ui/main/search/_components/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Colors.white, // Set the background color here
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBarV2(),
                  SizedBox(height: 16.0),
                  CategoryButtons(),
                  SizedBox(height: 16.0),
                  AuthorButtons(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
      ),
      endDrawer: CustomDrawer(
        selectedOption: _selectedOption,
        onOptionChanged: (String? newValue) {
          setState(
            () {
              _selectedOption = newValue;
            },
          );
        },
      ),
    );
  }
}