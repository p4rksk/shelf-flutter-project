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
          height: 600,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              BestsellerBookCard(
                book: bestsellerBooks[0],
                isFirst: true,
              ),
              Row(
                children: List.generate(
                  (bestsellerBooks.length - 1) ~/ 2,
                      (index) {
                    return Column(
                      children: [
                        BestsellerBookCard(
                          book: bestsellerBooks[2 * index + 1],
                        ),
                        BestsellerBookCard(
                          book: bestsellerBooks[2 * index + 2],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
