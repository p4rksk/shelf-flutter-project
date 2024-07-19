import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/_core/constants/size.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_viewmodel.dart';

import '_components/book_list_tab.dart';
import '_components/review_management_tab.dart';
import '_components/wish_list_tab.dart';

class MyShelf extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 현재 페이지 번호
    final int _selectedIndex = 2;

    // 세션 데이터 가져오기
    final session = ref.read(sessionProvider);
    final nickName = session.user?.nickName ?? 'Unknown';
    final createdAt = session.user?.createdAt ?? DateTime.now();

    // createdAt으로부터 현재까지의 일수 계산
    final daysWithShelf = DateTime.now().difference(createdAt).inDays;

    // MyShelfData 상태 구독
    final myShelfDataAsyncValue = ref.watch(myShelfDataProvider);

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
                collapsedHeight: 20,
                toolbarHeight: 20,
                leading: null,
                automaticallyImplyLeading: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [kAccentColor3, kAccentColor2],
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
                              '${nickName}의 서재',
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
                                      text: ' 와 함께한지 ${daysWithShelf}일 되셨어요!',
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
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: TColor.white,
                    ),
                    child: TabBar(
                      labelColor: Colors.black,
                      tabs: [
                        Tab(text: '책 목록'),
                        Tab(text: '위시리스트'),
                        Tab(text: '리뷰관리'),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: myShelfDataAsyncValue.when(
            data: (myShelfData) {
              return TabBarView(
                children: [
                  BookListTab(bookList: myShelfData.bookList),
                  WishlistTab(wishList: myShelfData.wishList),
                  ReviewManagementTab(),
                ],
              );
            },
            loading: () => Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err')),
          ),
        ),
        bottomNavigationBar: ModifiedBottomNavigator(
          selectedIndex: _selectedIndex,
        ),
      ),
    );
  }
}
