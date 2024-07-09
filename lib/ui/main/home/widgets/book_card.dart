import 'package:flutter/material.dart';

import '../../../../data/model/home/home_page_data.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final bool isFocused;

  BookCard({required this.book, required this.isFocused});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(book.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          book.title,
          style: TextStyle(
            color: isFocused ? Colors.black87 : Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          book.author,
          style: TextStyle(
            color: isFocused ? Colors.black54 : Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}