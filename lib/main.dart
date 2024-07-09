import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/ui/main/home/home_page.dart';
import 'package:untitled/ui/main/home/pages/book_detail_page.dart';
import 'package:untitled/ui/main/myshelf/my_shelf.dart';
import 'package:untitled/ui/main/search/search_page.dart';
import 'package:untitled/ui/startview/start_view_page.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BookDetailPage(),
    );
  }
}
