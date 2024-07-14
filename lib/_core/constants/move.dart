import 'package:flutter/material.dart';
import 'package:untitled/ui/main/home/home_page.dart';
import 'package:untitled/ui/main/home/pages/best_seller_detail_page.dart';
import 'package:untitled/ui/main/mypage/mypage.dart';
import 'package:untitled/ui/main/mypage/pages/myinfo/my_info.dart';
import 'package:untitled/ui/main/myshelf/my_shelf.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/category_result_page.dart';
import 'package:untitled/ui/main/search/pages/writer_result_page/writer_result_page.dart';
import 'package:untitled/ui/main/search/search_page.dart';
import 'package:untitled/ui/startview/start_view_page.dart';
import 'package:untitled/ui/main/mypage/pages/profile_edit_page.dart';
import 'package:untitled/ui/main/home/pages/brand_new_page.dart';

import '../../ui/main/mypage/pages/payment_management_page.dart';

class Move {
  static String startViewPage = "/start-view";
  static String loginPage = "/login";
  static String joinPage = "/join";
  static String homePage = "/home";
  static String bookDetailPage = "/home/detail";
  static String sellerDetailPage = "/home/seller-detail";
  static String brandNewPage = "/home/brand-new";
  static String searchPage = "/search";
  static String categoryResultPage = "/search/category";
  static String writerResultPage = "/search/writer";
  static String myShelfPage = "/myshelf";
  static String myPage = "/my-page";
  static String myInfo = "/my-page/info";
  static String profileEditPage = "/my-page/profile-edit";
  static String paymentManagementPage = "/my-page/payment_management";
}

Map<String, Widget Function(BuildContext)> getRouters() {
  return {
    Move.startViewPage: (context) => const StartViewPage(),
    Move.homePage: (context) => HomePage(),
    Move.sellerDetailPage: (context) => BestSellerDetailPage(),
    Move.searchPage: (context) => SearchPage(),
    Move.categoryResultPage: (context) => CategoryResultPage(),
    Move.writerResultPage: (context) => WriterResultPage(),
    Move.myShelfPage: (context) => MyShelf(),
    Move.myPage: (context) => const MyPage(),
    Move.myInfo: (context) => const MyInfo(),
    Move.profileEditPage: (context) => const ProfileEditPage(),
    Move.brandNewPage: (context) => BrandNewPage(),
    Move.paymentManagementPage: (context) => PaymentManagementPage(),
  };
}
