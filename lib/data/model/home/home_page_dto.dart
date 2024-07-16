class BestSellerDTO {
  final int id;
  final String bookImagePath;
  final String bookTitle;
  final String author;

  BestSellerDTO({required this.id, required this.bookImagePath, required this.bookTitle, required this.author});

  factory BestSellerDTO.fromJson(Map<String, dynamic> json) {
    return BestSellerDTO(
      id: json['id'],
      bookImagePath: json['bookImagePath'],
      bookTitle: json['bookTitle'],
      author: json['author'],
    );
  }
}

class DayBestSellerDTO {
  final int id;
  final String bookTitle;
  final String author;
  final String bookIntro;

  DayBestSellerDTO({required this.id, required this.bookTitle, required this.author, required this.bookIntro});

  factory DayBestSellerDTO.fromJson(Map<String, dynamic> json) {
    return DayBestSellerDTO(
      id: json['id'],
      bookTitle: json['bookTitle'],
      author: json['author'],
      bookIntro: json['bookIntro'],
    );
  }
}

class BookHistoryDTO {
  final int userId;
  final int bookId;
  final String bookTitle;
  final String pageCount;
  final String lastReadPage;

  BookHistoryDTO({required this.userId, required this.bookId, required this.bookTitle, required this.pageCount, required this.lastReadPage});

  factory BookHistoryDTO.fromJson(Map<String, dynamic> json) {
    return BookHistoryDTO(
      userId: json['userId'],
      bookId: json['bookId'],
      bookTitle: json['bookTitle'],
      pageCount: json['pageCount'],
      lastReadPage: json['lastReadPage'],
    );
  }
}

class HomeData {
  final List<BestSellerDTO> bestSellers;
  final List<BestSellerDTO> weekBestSellers;
  final DayBestSellerDTO dayBestSeller;
  final List<BookHistoryDTO> bookHistory;

  HomeData({required this.bestSellers, required this.weekBestSellers, required this.dayBestSeller, required this.bookHistory});

  factory HomeData.fromJson(Map<String, dynamic> json) {
    var bestSellersList = json['bestSellerDTOS'] as List;
    var weekBestSellersList = json['weekBestSellerDTOS'] as List;
    var bookHistoryList = json['bookHistoryDTOS'] as List;

    List<BestSellerDTO> bestSellers = bestSellersList.map((i) => BestSellerDTO.fromJson(i)).toList();
    List<BestSellerDTO> weekBestSellers = weekBestSellersList.map((i) => BestSellerDTO.fromJson(i)).toList();
    List<BookHistoryDTO> bookHistory = bookHistoryList.map((i) => BookHistoryDTO.fromJson(i)).toList();

    return HomeData(
      bestSellers: bestSellers,
      weekBestSellers: weekBestSellers,
      dayBestSeller: DayBestSellerDTO.fromJson(json['dayBestSellerDTO']),
      bookHistory: bookHistory,
    );
  }
}
