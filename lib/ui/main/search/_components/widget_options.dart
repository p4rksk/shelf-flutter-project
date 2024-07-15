import 'package:flutter/material.dart';
import 'package:shelf/ui/main/mypage/mypage.dart';
import 'package:shelf/ui/main/myshelf/my_shelf.dart';
import 'package:shelf/ui/main/search/search_page.dart';

import '../../home/home_page.dart';

final List<Widget> widgetOptions = <Widget>[
  HomePage(),
  SearchPage(),
  MyShelf(),
  MyPage(),
];
