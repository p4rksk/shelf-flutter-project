import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/http.dart';

import '../../../../../_core/constants/constants.dart';
import '../../../../../_core/constants/size.dart';
import '../../../../../data/model/home/book_detail_data.dart';
import '../../../../../data/repository/book_detail_repo.dart';
import '../../../../../data/store/wishlist_toggle.dart';
import '../../_components/book_introduction_tab.dart';
import '../../_components/review_tab.dart';
import '../../widgets/bottom_action_bar.dart';
import '../../widgets/pie_chart_widget.dart';

class BookDetailPage extends ConsumerWidget {
  final int? bookId;

  const BookDetailPage({Key? key, required this.bookId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookDetailState = ref.watch(bookDetailProvider(bookId!));

    return Scaffold(
      body: bookDetailState.when(
        data: (book) {
          final wishlist = ref.watch(wishlistProvider);
          final isFavorite = wishlist.contains(book);

          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [TColor.primaryColor1, TColor.secondaryColor2],
              ),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              ref
                                  .read(wishlistProvider.notifier)
                                  .toggleWishlist(book);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '이 책이 담긴 서재 $libraryCount',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.network(
                      baseURL + book.path,
                      height: 200,
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(gap_l),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  book.author.name,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  '${book.publisher} · ${book.category} · ${book.registrationDate}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 25, left: 25, right: 25, bottom: 25),
                                  decoration: BoxDecoration(
                                    color: Colors.white54.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        spreadRadius: 3,
                                        blurRadius: 5,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        height: 100,
                                        child: PieChartWidget(
                                          totalViews: book.totalViews,
                                          completedViews: book.completedViews,
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${((book.completedViews ?? 0) / (book.totalViews ?? 1) * 100).toStringAsFixed(1)}%의 구독자가 완독했어요!',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            '총 완독자 수 ${book.completedViews ?? 0}명',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          DefaultTabController(
                            length: 2,
                            child: Column(
                              children: [
                                TabBar(
                                  indicatorColor: TColor.primaryColor1,
                                  labelColor: Colors.black,
                                  tabs: [
                                    Tab(text: '책 소개'),
                                    Tab(text: '리뷰'),
                                  ],
                                ),
                                Container(
                                  height: 400,
                                  child: TabBarView(
                                    children: [
                                      BookIntroductionTab(book: book),
                                      ReviewTab(book: book),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
      bottomNavigationBar: BottomActionBar(),
    );
  }
}
