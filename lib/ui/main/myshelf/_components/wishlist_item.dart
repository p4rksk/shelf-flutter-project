import 'package:flutter/material.dart';
import 'package:shelf/data/model/myshelf/my_shelf_dto.dart';

class WishlistItem extends StatelessWidget {
  final WishBook book;

  const WishlistItem({
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                width: 130,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(book.bookImagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Icon(Icons.favorite, color: Colors.red),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            book.bookTitle,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            book.author,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
