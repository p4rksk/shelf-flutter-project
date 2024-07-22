import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/ui/pages/home/data/home_page_model.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/book_detail_page.dart';

class BookCard extends StatelessWidget {
  final BestSellerDTO book;
  final bool isFocused;

  BookCard({required this.book, required this.isFocused});

  @override
  Widget build(BuildContext context) {
    final imageUrl = '$baseURL${book.bookImagePath}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
        Container(
          width: 120,
          height: 45,
          child: Text(
            book.bookTitle,
            style: TextStyle(
              color: isFocused ? Colors.black87 : Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: 120,
          child: Text(
            book.author,
            style: TextStyle(
              color: isFocused ? Colors.black54 : Colors.grey,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}
