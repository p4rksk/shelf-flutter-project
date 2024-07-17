class CategoryResultAuthor {
  final int authorId;
  final String authorName;

  CategoryResultAuthor({
    required this.authorId,
    required this.authorName,
  });

  factory CategoryResultAuthor.fromJson(Map<String, dynamic> json) {
    return CategoryResultAuthor(
      authorId: json['authorId'],
      authorName: json['authorName'],
    );
  }
}

class CategoryResultBook {
  final int bookId;
  final String bookTitle;
  final String bookPath;
  final CategoryResultAuthor author;

  CategoryResultBook({
    required this.bookId,
    required this.bookTitle,
    required this.bookPath,
    required this.author,
  });

  factory CategoryResultBook.fromJson(Map<String, dynamic> json) {
    return CategoryResultBook(
      bookId: json['bookId'],
      bookTitle: json['bookTitle'],
      bookPath: json['bookPath'],
      author: CategoryResultAuthor.fromJson(json['author']),
    );
  }
}

class CategoryResultDTO {
  final int bookCount;
  final List<CategoryResultBook> books;

  CategoryResultDTO({
    required this.bookCount,
    required this.books,
  });

  factory CategoryResultDTO.fromJson(Map<String, dynamic> json) {
    var bookList = json['book'] as List;
    List<CategoryResultBook> books =
        bookList.map((i) => CategoryResultBook.fromJson(i)).toList();

    return CategoryResultDTO(
      bookCount: json['bookCount'],
      books: books,
    );
  }
}
