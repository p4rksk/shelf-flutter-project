import 'package:shelf/_core/constants/http.dart';

class BestSellerDTO {
  final int id;
  final String bookImagePath;
  final String bookTitle;
  final String author;
  final String rankNum;

  BestSellerDTO({
    required this.id,
    required this.bookImagePath,
    required this.bookTitle,
    required this.author,
    required this.rankNum,
  });

  factory BestSellerDTO.fromJson(Map<String, dynamic> json) {
    return BestSellerDTO(
      id: json['id'],
      bookImagePath: json['bookImagePath'],
      bookTitle: json['bookTitle'],
      author: json['author'],
      rankNum: json['rankNum'].toString(),
    );
  }
}

class DayBestSellerDTO {
  final int id;
  final String bookTitle;
  final String author;
  final String bookIntro;
  final String bookImagePath;

  DayBestSellerDTO({
    required this.id,
    required this.bookTitle,
    required this.author,
    required this.bookIntro,
    required this.bookImagePath,
  });

  factory DayBestSellerDTO.fromJson(Map<String, dynamic> json) {
    return DayBestSellerDTO(
      id: json['id'],
      bookTitle: json['bookTitle'],
      author: json['author'],
      bookIntro: json['bookIntro'],
      bookImagePath: json['bookImagePath'],
    );
  }
}

class BookHistoryDTO {
  final int userId;
  final int bookId;
  final String bookTitle;
  final int pageCount;
  final int lastReadPage;
  final String bookImagePath;

  BookHistoryDTO({
    required this.userId,
    required this.bookId,
    required this.bookTitle,
    required this.pageCount,
    required this.lastReadPage,
    required this.bookImagePath,
  });

  factory BookHistoryDTO.fromJson(Map<String, dynamic> json) {
    return BookHistoryDTO(
      userId: json['userId'],
      bookId: json['bookId'],
      bookTitle: json['bookTitle'],
      pageCount: json['pageCount'],
      lastReadPage: json['lastReadPage'],
      bookImagePath: json['bookImagePath'],
    );
  }
}

class HomeData {
  final List<BestSellerDTO> bestSellers;
  final List<BestSellerDTO> weekBestSellers;
  final DayBestSellerDTO dayBestSeller;
  final List<BookHistoryDTO> bookHistory;

  HomeData({
    required this.bestSellers,
    required this.weekBestSellers,
    required this.dayBestSeller,
    required this.bookHistory,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) {
    var bestSellersList = json['bestSellerDTOS'] as List;
    var weekBestSellersList = json['weekBestSellerDTOS'] as List;
    var bookHistoryList = json['bookHistoryDTOS'] as List;

    List<BestSellerDTO> bestSellers =
        bestSellersList.map((i) => BestSellerDTO.fromJson(i)).toList();
    List<BestSellerDTO> weekBestSellers =
        weekBestSellersList.map((i) => BestSellerDTO.fromJson(i)).toList();
    List<BookHistoryDTO> bookHistory =
        bookHistoryList.map((i) => BookHistoryDTO.fromJson(i)).toList();
    logger.d("👉👉👉👉");

    return HomeData(
      bestSellers: bestSellers,
      weekBestSellers: weekBestSellers,
      dayBestSeller: DayBestSellerDTO.fromJson(json['dayBestSellerDTO']),
      bookHistory: bookHistory,
    );
  }
}
