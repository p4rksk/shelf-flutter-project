import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/_core/constants/size.dart';
import 'package:shelf/data/model/myshelf/my_shelf_dto.dart';

class ReadBooksSection extends StatelessWidget {
  final List<AllBook> allBook;

  const ReadBooksSection({
    required this.allBook,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Text(
            '전체도서',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 16.0,
            children: allBook.map((book) {
              return Container(
                width: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(baseURL + book.bookImagePath),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
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
            }).toList(),
          ),
        ),
      ],
    );
  }
}
