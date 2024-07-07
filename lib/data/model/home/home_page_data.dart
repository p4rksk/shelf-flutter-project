import 'package:flutter/material.dart';

class Book {
  final String imagePath;
  final String title;
  final String author;

  Book({required this.imagePath, required this.title, required this.author});
}

// 책 목록 더미 데이터
final List<Book> books = [
  Book(imagePath: 'assets/images/book1.png', title: '책제목 1', author: '작가 1'),
  Book(imagePath: 'assets/images/book2.png', title: '책제목 2', author: '작가 2'),
  Book(imagePath: 'assets/images/book3.png', title: '책제목 3', author: '작가 3'),
  Book(imagePath: 'assets/images/book4.png', title: '책제목 4', author: '작가 4'),
  Book(imagePath: 'assets/images/book5.png', title: '책제목 5', author: '작가 5'),
  Book(imagePath: 'assets/images/book6.png', title: '책제목 6', author: '작가 6'),
];

final List<Book> historyBooks = [
  Book(imagePath: 'assets/images/book1.png', title: '책 제목 1', author: '작가 1'),
  Book(imagePath: 'assets/images/book2.png', title: '책 제목 2', author: '작가 2'),
];
