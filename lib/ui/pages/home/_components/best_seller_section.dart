import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/ui/pages/home/data/home_page_model.dart';

import '../pages/best_seller_detail_page.dart';
import '../widgets/best_seller_book_card.dart';

class BestSellerSection extends StatelessWidget {
  final List<BestSellerDTO> books;

  const BestSellerSection({
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '베스트셀러',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BestSellerDetailPage(),
                      ),
                    );
                  },
                  child: Text(
                    '베스트셀러 더보기>',
                    style: TextStyle(
                      fontSize: 16,
                      color: kAccentColor3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 500,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                BestsellerBookCard(
                  book: books[0],
                  isFirst: true,
                ),
                Row(
                  children: List.generate(
                    (books.length - 1) ~/ 2,
                    (index) => Column(
                      children: [
                        Container(
                          width: 120,
                          child: BestsellerBookCard(
                            book: books[2 * index + 1],
                          ),
                        ),
                        SizedBox(height: 10),
                        if (2 * index + 2 < books.length)
                          Container(
                            width: 120,
                            child: BestsellerBookCard(
                              book: books[2 * index + 2],
                            ),
                          ),
                      ],
                    ),
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
