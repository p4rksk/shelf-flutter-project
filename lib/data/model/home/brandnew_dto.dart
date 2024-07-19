class BrandNewRespDTO {
  final String brandNewWeekly;
  final List<BrandNewList> brandNewList;

  BrandNewRespDTO({
    required this.brandNewWeekly,
    required this.brandNewList,
  });

  factory BrandNewRespDTO.fromJson(Map<String, dynamic> json) {
    var list = json['brandNewList'] as List;
    List<BrandNewList> brandNewList = list.map((i) => BrandNewList.fromJson(i)).toList();

    return BrandNewRespDTO(
      brandNewWeekly: json['brandNewWeekly'],
      brandNewList: brandNewList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'brandNewWeekly': brandNewWeekly,
      'brandNewList': brandNewList.map((book) => book.toJson()).toList(),
    };
  }
}

class BrandNewList {
  final int bookId;
  final String title;
  final String author;
  final String path;

  BrandNewList({
    required this.bookId,
    required this.title,
    required this.author,
    required this.path,
  });

  factory BrandNewList.fromJson(Map<String, dynamic> json) {
    return BrandNewList(
      bookId: json['bookId'],
      title: json['title'],
      author: json['author'],
      path: json['path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'bookId': bookId,
      'title': title,
      'author': author,
      'path': path,
    };
  }
}
