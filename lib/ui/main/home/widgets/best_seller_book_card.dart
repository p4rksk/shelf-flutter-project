import 'package:flutter/material.dart';
import '../../../../data/model/home/home_page_data.dart';

class BestsellerBookCard extends StatelessWidget {
  final BestsellerBook book;
  final bool isFirst;

  BestsellerBookCard({required this.book, this.isFirst = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isFirst ? 180 : 100,
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: isFirst ? 180 : 100,
                height: isFirst ? 270 : 160,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(book.imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    book.rank,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 40,
            child: Text(
              book.title,
              style: TextStyle(
                fontSize: isFirst ? 16 : 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(height: 5),
          Container(
            height: 20,
            child: Text(
              book.author,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
