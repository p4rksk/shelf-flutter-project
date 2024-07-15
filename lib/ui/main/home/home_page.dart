import 'package:flutter/material.dart';
import 'package:shelf/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:shelf/ui/main/home/_components/best_seller_section.dart';
import 'package:shelf/ui/main/home/_components/book_of_the_day_section.dart';
import 'package:shelf/ui/main/home/_components/history_section.dart';
import 'package:shelf/ui/main/home/_components/top_pick_section.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopPicksSection(),
            HistorySection(),
            BookOfTheDaySection(),
            BestSellerSection(),
          ],
        ),
      ),
      bottomNavigationBar: ModifiedBottomNavigator(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
