import 'package:shelf/data/model/book/author_detail.dart';

class BookDetailDTO {
  final int id;
  final String path;
  final String title;
  final AuthorDetail author;
  final String publisher;
  final String category;
  final DateTime createdAt;
  final String bookIntro;
  final String contentIntro;
  final bool isWish;
  final DateTime registrationDate;
  final int totalViews;
  final int completedViews;

  const BookDetailDTO({
    required this.id,
    required this.path,
    required this.title,
    required this.author,
    required this.publisher,
    required this.category,
    required this.createdAt,
    required this.bookIntro,
    required this.contentIntro,
    required this.isWish,
    required this.registrationDate,
    required this.totalViews,
    required this.completedViews,
  });

  factory BookDetailDTO.fromJson(Map<String, dynamic> json) {
    return BookDetailDTO(
      id: json["id"],
      path: json["path"],
      title: json["title"],
      author: AuthorDetail.fromJson(json["author"]),
      publisher: json["publisher"],
      category: json["category"],
      createdAt: DateTime.parse(json["createdAt"]),
      bookIntro: json["bookIntro"],
      contentIntro: json["contentIntro"],
      isWish: json["isWish"],
      registrationDate: DateTime.parse(json["registrationDate"]),
      totalViews: json["totalViews"],
      completedViews: json["completedViews"],
    );
  }

  BookDetailDTO copyWith({
    int? id,
    String? path,
    String? title,
    AuthorDetail? author,
    String? publisher,
    String? category,
    DateTime? createdAt,
    String? bookIntro,
    String? contentIntro,
    bool? isWish,
    DateTime? registrationDate,
    int? totalViews,
    int? completedViews,
  }) {
    return BookDetailDTO(
      id: id ?? this.id,
      path: path ?? this.path,
      title: title ?? this.title,
      author: author ?? this.author,
      publisher: publisher ?? this.publisher,
      category: category ?? this.category,
      createdAt: createdAt ?? this.createdAt,
      bookIntro: bookIntro ?? this.bookIntro,
      contentIntro: contentIntro ?? this.contentIntro,
      isWish: isWish ?? this.isWish,
      registrationDate: registrationDate ?? this.registrationDate,
      totalViews: totalViews ?? this.totalViews,
      completedViews: completedViews ?? this.completedViews,
    );
  }
}

class IsWish {
  final int? userId;
  final int? bookId;
  final bool? isWish;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const IsWish({
    required this.userId,
    required this.bookId,
    required this.isWish,
    required this.createdAt,
    required this.updatedAt,
  });

  factory IsWish.fromJson(Map<String, dynamic> json) {
    return IsWish(
      userId: json['userId'],
      bookId: json['bookId'],
      isWish: json['isWish'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }
}
