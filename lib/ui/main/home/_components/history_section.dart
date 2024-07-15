import 'package:flutter/material.dart';

import '../../../../data/model/home/home_page_data.dart';
import '../widgets/history_book_card.dart';

class HistorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 40),
          child: Text(
            '히스토리',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: historyBooks.length,
            itemBuilder: (context, index) {
              final book = historyBooks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: HistoryBookCard(historyBook: book),
              );
            },
          ),
        ),
      ],
    );
  }
}
