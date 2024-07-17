import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/model/home/home_page_dto.dart';
import 'package:shelf/ui/main/home/pages/book_detail_page/book_detail_page.dart';


class BookCard extends StatelessWidget {
  final BestSellerDTO book;
  final bool isFocused;

  BookCard({required this.book, required this.isFocused});

  @override
  Widget build(BuildContext context) {
    final imageUrl = '$baseURL${book.bookImagePath}';

    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookDetailPage(bookId: book.id),
              ),
            );
          },
          child: Container(
            width: 120,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          book.bookTitle,
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
