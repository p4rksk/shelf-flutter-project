class Book {
  final String title;
  final String author;
  final int completionRate;
  final int readTime;
  final String path;

  Book(this.title, this.author, this.completionRate, this.readTime, this.path);

  String getPath() {
    return path.isNotEmpty ? path : 'assets/images/book1.png';
  }
}

final List<Book> books = [
  Book('위대한 개츠비', 'F.스콧피츠제럴드', 83, 12, 'assets/images/gatsby.jpg'),
  Book('달러구트 꿈 백화점', '이미예', 80, 10, 'assets/images/dallor.jpg'),
  Book('데일 카네기 인간관계론', '데일카네기', 58, 8, 'assets/images/dale.jpg'),
  Book('역행자 : 확장판', '자청', 44, 10, 'assets/images/reverse.jpg'),
  Book('모든 삶은 흐른다', '로랑스 드빌레르', 40, 24, 'assets/images/flow.jpg'),
];

