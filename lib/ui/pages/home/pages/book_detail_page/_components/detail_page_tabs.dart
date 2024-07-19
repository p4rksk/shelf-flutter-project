import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/ui/pages/home/_components/book_introduction_tab.dart';
import 'package:shelf/ui/pages/home/_components/review_tab.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_viewmodel.dart';

class DetailPageTabs extends StatelessWidget {
  final BookDetailDTO book;

  const DetailPageTabs({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
    );
  }
}
