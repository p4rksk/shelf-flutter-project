import 'package:flutter/material.dart';
import 'package:untitled/data/model/home/book_detail_data.dart';
import 'package:untitled/ui/main/home/home_page.dart';
import 'package:untitled/ui/main/home/pages/best_seller_detail_page.dart';
import 'package:untitled/ui/main/home/pages/book_detail_page.dart';
import 'package:untitled/ui/main/mypage/mypage.dart';
import 'package:untitled/ui/main/mypage/pages/myinfo/my_info.dart';
import 'package:untitled/ui/main/myshelf/my_shelf.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/category_result_page.dart';
import 'package:untitled/ui/main/search/pages/writer_result_page/writer_result_page.dart';
import 'package:untitled/ui/main/search/search_page.dart';
import 'package:untitled/ui/startview/start_view_page.dart';

class Move {
  static String startViewPage = "/start-view";
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String homePage = "/home";
  static String bookDetailPage = "/home/detail";
  static String sellerDetailPage = "/home/seller-detail";
  static String searchPage = "/search";
  static String categoryResultPage = "/search/category";
  static String writerResultPage = "/search/writer";
  static String myShelfPage = "/myshelf";
  static String myPage = "/my-page";
  static String myInfo = "/my-page/info";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.startViewPage: (context) => const StartViewPage(),
    Move.homePage: (context) => HomePage(),
    Move.bookDetailPage: (context) => BookDetailPage(
          book: bookDetail,
        ),
    Move.sellerDetailPage: (context) => BestSellerDetailPage(),
    Move.searchPage: (context) => SearchPage(),
    Move.categoryResultPage: (context) => CategoryResultPage(),
    Move.writerResultPage: (context) => WriterResultPage(),
    Move.myShelfPage: (context) => MyShelf(),
    Move.myPage: (context) => const MyPage(),
    Move.myInfo: (context) => const MyInfo(),
  };
}
