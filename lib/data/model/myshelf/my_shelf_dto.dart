class HistoryBook {
  final int id;
  final String imagePath;
  final String bookTitle;
  final int pageCount;
  final int lastReadPage;

  HistoryBook({
    required this.id,
    required this.imagePath,
    required this.bookTitle,
    required this.pageCount,
    required this.lastReadPage,
  });

  factory HistoryBook.fromJson(Map<String, dynamic> json) {
    return HistoryBook(
      id: json['id'],
      imagePath: json['imagePath'],
      bookTitle: json['bookTitle'],
      pageCount: int.parse(json['pageCount']),
      lastReadPage: int.parse(json['lastReadPage']),
    );
  }
}

class AllBook {
  final int id;
  final String bookImagePath;
  final String bookTitle;
  final String author;

  AllBook({
    required this.id,
    required this.bookImagePath,
    required this.bookTitle,
    required this.author,
  });

  factory AllBook.fromJson(Map<String, dynamic> json) {
    return AllBook(
      id: json['id'],
      bookImagePath: json['bookImagePath'],
      bookTitle: json['bookTitle'],
      author: json['author'],
    );
  }
}

class WishBook {
  final int id;
  final int bookId;
  final String bookImagePath;
  final String bookTitle;
  final String author;
  final String createdAt;

  WishBook({
    required this.id,
    required this.bookId,
    required this.bookImagePath,
    required this.bookTitle,
    required this.author,
    required this.createdAt
  });

  factory WishBook.fromJson(Map<String, dynamic> json) {
    return WishBook(
      id: json['id'],
      bookId: json['bookId'],
      bookImagePath: json['bookImagePath'],
      bookTitle: json['bookTitle'],
      author: json['author'],
      createdAt: json['createdAt']
    );
  }
}

class BookList {
  final List<HistoryBook> historyList;
  final List<AllBook> allBook;

  BookList({
    required this.historyList,
    required this.allBook,
  });

  factory BookList.fromJson(Map<String, dynamic> json) {
    var historyList = json['historyList'] as List;
    var allBook = json['allBook'] as List;

    return BookList(
      historyList: historyList.map((i) => HistoryBook.fromJson(i)).toList(),
      allBook: allBook.map((i) => AllBook.fromJson(i)).toList(),
    );
  }
}

class MyShelfData {
  final List<BookList> bookList;
  final List<WishBook> wishList;

  MyShelfData({
    required this.bookList,
    required this.wishList,
  });

  factory MyShelfData.fromJson(Map<String, dynamic> json) {
    var bookList = json['bookList'] as List;
    var wishList = json['wishList'] as List;

    return MyShelfData(
      bookList: bookList.map((i) => BookList.fromJson(i)).toList(),
      wishList: wishList.map((i) => WishBook.fromJson(i)).toList(),
    );
  }
}