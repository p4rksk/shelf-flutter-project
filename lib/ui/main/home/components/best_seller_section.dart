import 'package:flutter/material.dart';
import '../../../../data/model/home/home_page_data.dart';
import '../widgets/best_seller_book_card.dart';

class BestSellerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, bottom: 20),
          child: Text(
            '베스트셀러',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 400,
          child: ListView.builder(
            itemCount: bestsellerBooks.length,
            itemBuilder: (context, index) {
              final book = bestsellerBooks[index];
              return BestsellerBookCard(book: book);
            },
          ),
        ),
      ],
    );
  }
}
