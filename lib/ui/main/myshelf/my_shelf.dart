import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/constants.dart';
import 'package:untitled/_core/constants/size.dart';
import 'package:untitled/ui/common/components/modified_bottom_navigation_bar.dart';

import '../../../data/model/home/my_shelf_data.dart';
import '_components/book_list_tab.dart';
import '_components/review_management_tab.dart';
import '_components/wish_list_tab.dart';

class MyShelf extends StatefulWidget {
  @override
  State<MyShelf> createState() => _MyShelfState();
}

class _MyShelfState extends State<MyShelf> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: TColor.white,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [kAccentColor2, kAccentColor3],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: gap_xl),
                            Text(
                              '${userData.userName}의 서재',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              padding: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Shelf',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        foreground: Paint()
                                          ..shader = LinearGradient(
                                            colors: [
                                              Colors.blue,
                                              Colors.purple
                                            ],
                                          ).createShader(
                                              Rect.fromLTWH(0, 0, 100, 20)),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          ' 와 함께한지 ${userData.daysWithShelf}일 되셨어요!',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                bottom: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(text: '책 목록'),
                    Tab(text: '위시리스트'),
                    Tab(text: '리뷰관리'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              BookListTab(),
              WishlistTab(),
              ReviewManagementTab(),
            ],
          ),
        ),
        bottomNavigationBar: ModifiedBottomNavigator(
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}
