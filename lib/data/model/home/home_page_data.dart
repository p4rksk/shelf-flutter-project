class Book {
  final String imagePath;
  final String title;
  final String author;

  Book({required this.imagePath, required this.title, required this.author});
}

class HistoryBook extends Book {
  final double readingProgress;

  HistoryBook({
    required String imagePath,
    required String title,
    required String author,
    required this.readingProgress,
  }) : super(imagePath: imagePath, title: title, author: author);
}

class BookOfTheDay {
  final String imagePath;
  final String title;
  final String author;
  final String description;

  BookOfTheDay({
    required this.imagePath,
    required this.title,
    required this.author,
    required this.description,
  });
}

class BestsellerBook {
  final String imagePath;
  final String title;
  final String author;
  final String rank;
  final String salesInfo;

  BestsellerBook({
    required this.imagePath,
    required this.title,
    required this.author,
    required this.rank,
    required this.salesInfo,
  });
}

final List<Book> books = [
  Book(imagePath: 'assets/images/book1.png', title: '책제목 1', author: '작가 1'),
  Book(imagePath: 'assets/images/book2.png', title: '책제목 2', author: '작가 2'),
  Book(imagePath: 'assets/images/book3.png', title: '책제목 3', author: '작가 3'),
  Book(imagePath: 'assets/images/book4.png', title: '책제목 4', author: '작가 4'),
  Book(imagePath: 'assets/images/book5.png', title: '책제목 5', author: '작가 5'),
  Book(imagePath: 'assets/images/book6.png', title: '책제목 6', author: '작가 6'),
];

final List<HistoryBook> historyBooks = [
  HistoryBook(imagePath: 'assets/images/book1.png', title: '책 제목 1', author: '작가 1', readingProgress: 0.7),
  HistoryBook(imagePath: 'assets/images/book2.png', title: '책 제목 2', author: '작가 2', readingProgress: 0.8),
];

final bookOfTheDay = BookOfTheDay(
  imagePath: 'assets/images/book1.png',
  title: '책제목',
  author: '작가 이름',
  description: '책 소개 내용.',
);

final List<BestsellerBook> bestsellerBooks = [
  BestsellerBook(
    imagePath: 'assets/images/book1.png',
    title: '퀀의 대각선 1',
    author: '베르나르 베르베르',
    rank: '1',
    salesInfo: '서점 베스트 12위',
  ),
  BestsellerBook(
    imagePath: 'assets/images/book2.png',
    title: '나를 소모하지 않는 현...',
    author: '마티아스 볼케',
    rank: '2',
    salesInfo: '서점 베스트 2위',
  ),
  BestsellerBook(
    imagePath: 'assets/images/book3.png',
    title: '리틀 라이프 1',
    author: '한야 야나기하라',
    rank: '3',
    salesInfo: '서점 베스트 1위',
  ),
  BestsellerBook(
    imagePath: 'assets/images/book4.png',
    title: '인사이드 아웃 2 스토...',
    author: 'Disney Books',
    rank: '4',
    salesInfo: '',
  ),
  BestsellerBook(
    imagePath: 'assets/images/book5.png',
    title: '심령 스팟',
    author: '밀리의 서재',
    rank: '5',
    salesInfo: '2위 상승',
  ),
  BestsellerBook(
    imagePath: 'assets/images/book6.png',
    title: '초역 부처의 말',
    author: '코이케 류노스케',
    rank: '6',
    salesInfo: '서점 베스트 6위',
  ),
  BestsellerBook(
    imagePath: 'assets/images/book7.png',
    title: '[독점] 당신도 논리...',
    author: '오시마 도모히데',
    rank: '7',
    salesInfo: '',
  ),
  BestsellerBook(
    imagePath: 'assets/images/book8.png',
    title: '마흔에 읽는 쇼펜하우...',
    author: '강용수',
    rank: '8',
    salesInfo: '서점 베스트 3위',
  ),
  BestsellerBook(
    imagePath: 'assets/images/book9.png',
    title: '이처럼 사소한 것들',
    author: '클레어 키건',
    rank: '9',
    salesInfo: '서점 베스트 26위',
  ),
];
