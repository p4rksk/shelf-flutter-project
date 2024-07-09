import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/constants.dart';
import 'package:untitled/_core/constants/size.dart';
import '../../../../data/model/home/home_page_data.dart';
import '../pages/best_seller_detail_page.dart';
import '../widgets/best_seller_book_card.dart';

class BestSellerSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_l),
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
                    '서점 베스트셀러 더보기>',
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
            height: 600,
            child: Row(
              children: [
                BestsellerBookCard(
                  book: bestsellerBooks[0],
                  isFirst: true,
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (bestsellerBooks.length - 1) ~/ 2 + 1, // 18위 책
                    itemBuilder: (context, index) {
                      if (index < (bestsellerBooks.length - 1) / 2) {
                        return Column(
                          children: [
                            BestsellerBookCard(
                              book: bestsellerBooks[2 * index + 1],
                            ),
                            if (2 * index + 2 < bestsellerBooks.length)
                              BestsellerBookCard(
                                book: bestsellerBooks[2 * index + 2],
                              ),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
