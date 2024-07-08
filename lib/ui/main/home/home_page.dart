import 'package:flutter/material.dart';
import 'components/best_seller_section.dart';
import 'components/book_of_the_day_section.dart';
import 'components/top_pick_section.dart';
import 'components/history_section.dart';

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
            Container(
              height: 400,
              child: Center(
                child: Text('홈'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
