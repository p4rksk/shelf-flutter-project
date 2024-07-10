import 'package:flutter/material.dart';
import '../../../../_core/constants/size.dart';
import '../../../../data/model/myshelf/my_shelf_data.dart';

class WishlistTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 16.0,
        children: wishlistBooks.map((book) {
          return WishlistItem(book: book);
        }).toList(),
      ),
    );
  }
}

class WishlistItem extends StatelessWidget {
  final WishlistBook book;

  WishlistItem({required this.book});

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
                    image: AssetImage(book.imagePath),
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
            book.title,
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