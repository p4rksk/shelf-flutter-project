import 'package:flutter/material.dart';
import '../../../../data/model/home/home_page_data.dart';

class BestsellerBookCard extends StatelessWidget {
  final BestsellerBook book;

  BestsellerBookCard({required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Row(
        children: [
          Text(
            book.rank,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 20),
          Container(
            width: 50,
            height: 75,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(book.imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  book.author,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                if (book.salesInfo.isNotEmpty)
                  Text(
                    book.salesInfo,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
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
