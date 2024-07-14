final List<Map<String, String>> sortBy = [
  {'name': '완독할 확률 높은순'},
  {'name': '인기 순'},
  {'name': '출간일 순'},
  {'name': '업데이트 순'},
  {'name': '제목순'},
];

class CategoryResult {
  int categoryId;
  String authorName;
  String bookTitle;
  String bookPath;
  int bookCount;

  CategoryResult({
    required this.categoryId,
    required this.authorName,
    required this.bookTitle,
    required this.bookPath,
    required this.bookCount,
  });

  Map<String, dynamic> toJson() {
    return {
      "categoryId": this.categoryId,
      "authorName": this.authorName,
      "bookTitle": this.bookTitle,
      "bookPath": this.bookPath,
      "bookCount": this.bookCount,
    };
  }

  factory CategoryResult.fromJson(Map<String, dynamic> json) {
    return CategoryResult(
      categoryId: int.parse(json["categoryId"]),
      authorName: json["authorName"],
      bookTitle: json["bookTitle"],
      bookPath: json["bookPath"],
      bookCount: int.parse(json["bookCount"]),
    );
  }
}
