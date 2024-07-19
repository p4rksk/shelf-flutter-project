import 'package:flutter/material.dart';
import 'package:shelf/ui/pages/mypage/mypage.dart';
import 'package:shelf/ui/pages/myshelf/my_shelf.dart';
import 'package:shelf/ui/pages/search/search_page.dart';

import '../../home/home_page.dart';

final List<Widget> widgetOptions = <Widget>[
  HomePage(),
  SearchPage(),
  MyShelf(),
  MyPage(),
];
