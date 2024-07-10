import 'package:flutter/material.dart';

import '../../../../data/model/home/book_detail_data.dart';


class BookDetailPage extends StatelessWidget {
  final Book book;

  BookDetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(book.imagePath, fit: BoxFit.cover),
              SizedBox(height: 16.0),
              Text(
                book.title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '저자: ${book.author}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '출판사: ${book.publisher}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '카테고리: ${book.category}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                '등록일: ${book.registrationDate}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '한 줄 요약',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                book.oneLineSummary,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '책 소개',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                book.introduction,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '작가 소개',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                book.authorIntroduction,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
