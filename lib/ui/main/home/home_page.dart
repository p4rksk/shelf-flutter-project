import 'package:flutter/material.dart';
import 'package:untitled/ui/main/home/_components/best_seller_section.dart';
import 'package:untitled/ui/main/home/_components/book_of_the_day_section.dart';
import 'package:untitled/ui/main/home/_components/history_section.dart';
import 'package:untitled/ui/main/home/_components/top_pick_section.dart';

class HomePage extends StatelessWidget {
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
    );
  }
}
