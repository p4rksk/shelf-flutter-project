import 'package:flutter/material.dart';
import 'package:shelf/data/model/home/home_page_dto.dart';

class BestsellerBookCard extends StatelessWidget {
  final BestSellerDTO book;
  final bool isFirst;

  BestsellerBookCard({required this.book, this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFirst ? 280 : 200, // 1등 책의 너비를 더 늘림
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: isFirst ? 250 : 100, // 1등 책의 너비를 더 늘림
                height: isFirst ? 384 : 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(book.bookImagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                bottom: isFirst ? -35 : -10,
                left: isFirst ? -40 : -15,
                child: Text(
                  book.rankNum,
                  style: TextStyle(
                    fontSize: isFirst ? 120 : 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(2.0, 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            book.bookTitle,
            style: TextStyle(
              fontSize: isFirst ? 25 : 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5),
          Text(
            book.author,
            style: TextStyle(
              fontSize: isFirst ? 15 : 12,
              color: Colors.grey,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
