import 'package:flutter/material.dart';
import 'package:shelf/ui/pages/home/data/home_page_model.dart';

import '../widgets/book_of_the_day_card.dart';

class BookOfTheDaySection extends StatelessWidget {
  final DayBestSellerDTO book;

  BookOfTheDaySection({required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 40),
          child: Text(
            'Book of the day',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 250,
          child: Stack(
            children: [
              Center(
                child: BookOfTheDayCard(book: book),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
