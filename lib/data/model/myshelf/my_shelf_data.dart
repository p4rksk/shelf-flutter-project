import '../home/home_page_data.dart';

class MyReview {
  final String bookImagePath;
  final String reviewContent;
  final String date;
  final String bookTitle;
  final String bookAuthor;

  MyReview({
    required this.bookImagePath,
    required this.reviewContent,
    required this.date,
    required this.bookTitle,
    required this.bookAuthor,
  });
}

class UserData {
  final String userName;
  final DateTime createdAt;
  final List<HistoryBook> historyBooks;
  final List<Book> readBooks;
  final List<MyReview> reviews;

  UserData({
    required this.userName,
    required this.createdAt,
    required this.historyBooks,
    required this.readBooks,
    required this.reviews,
  });

  int get daysWithShelf {
    return DateTime.now().difference(createdAt).inDays;
  }
}

final UserData userData = UserData(
  userName: '김성훈',
  createdAt: DateTime(2023, 1, 1),
  historyBooks: [
    HistoryBook(imagePath: 'assets/images/book1.png', title: '책 제목 1', author: '작가 1', readingProgress: 0.7),
    HistoryBook(imagePath: 'assets/images/book2.png', title: '책 제목 2', author: '작가 2', readingProgress: 0.8),
  ],
  readBooks: [
    Book(imagePath: 'assets/images/book1.png', title: '책제목 1', author: '작가 1'),
    Book(imagePath: 'assets/images/book2.png', title: '책제목 2', author: '작가 2'),
    Book(imagePath: 'assets/images/book3.png', title: '책제목 3', author: '작가 3'),
    Book(imagePath: 'assets/images/book4.png', title: '책제목 4', author: '작가 4'),
    Book(imagePath: 'assets/images/book5.png', title: '책제목 5', author: '작가 5'),
    Book(imagePath: 'assets/images/book6.png', title: '책제목 6', author: '작가 6'),
  ],
  reviews: [
    MyReview(
      bookImagePath: 'assets/images/book1.png',
      reviewContent: '정말 재미있는 책이었어요!',
      date: '2024-07-01',
      bookTitle: '책 제목 1',
      bookAuthor: '작가 1',
    ),
    MyReview(
      bookImagePath: 'assets/images/book2.png',
      reviewContent: '내용이 아주 흥미로웠습니다.',
      date: '2024-06-28',
      bookTitle: '책 제목 2',
      bookAuthor: '작가 2',
    ),
    MyReview(
      bookImagePath: 'assets/images/book3.png',
      reviewContent: '추천합니다!',
      date: '2024-06-25',
      bookTitle: '책 제목 3',
      bookAuthor: '작가 3',
    ),
  ],
);



// 더미 데이터 모델
class WishlistBook {
  final String title;
  final String author;
  final String imagePath;

  WishlistBook({required this.title, required this.author, required this.imagePath});
}

final List<WishlistBook> wishlistBooks = [
  WishlistBook(title: '퀸의 대각선', author: '베르나르 베르베르', imagePath: 'assets/images/book1.png'),
  WishlistBook(title: '책 제목 2', author: '저자 2', imagePath: 'assets/images/book6.png'),
  WishlistBook(title: '책 제목 3', author: '저자 3', imagePath: 'assets/images/book2.png'),
  WishlistBook(title: '책 제목 4', author: '저자 4', imagePath: 'assets/images/book3.png'),
  WishlistBook(title: '책 제목 5', author: '저자 5', imagePath: 'assets/images/book5.png'),
  WishlistBook(title: '책 제목 6', author: '저자 6', imagePath: 'assets/images/book8.png'),
];