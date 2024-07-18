class WriterResultAuthor {
  final int authorId;
  final String authorName;

  WriterResultAuthor({
    required this.authorId,
    required this.authorName,
  });

  factory WriterResultAuthor.fromJson(Map<String, dynamic> json) {
    return WriterResultAuthor(
      authorId: json['authorId'],
      authorName: json['authorName'],
    );
  }
}

class WriterResultBook {
  final int bookId;
  final String bookTitle;
  final String bookPath;
  final WriterResultAuthor author;

  WriterResultBook({
    required this.bookId,
    required this.bookTitle,
    required this.bookPath,
    required this.author,
  });

  factory WriterResultBook.fromJson(Map<String, dynamic> json) {
    return WriterResultBook(
      bookId: json['bookId'],
      bookTitle: json['bookTitle'],
      bookPath: json['bookPath'],
      author: WriterResultAuthor.fromJson(json['author']),
    );
  }
}

class WriterResultDTO {
  final int bookCount;
  final List<WriterResultBook> books;

  WriterResultDTO({
    required this.bookCount,
    required this.books,
  });

  factory WriterResultDTO.fromJson(Map<String, dynamic> json) {
    var bookList = json['book'] as List;
    List<WriterResultBook> books =
        bookList.map((i) => WriterResultBook.fromJson(i)).toList();

    return WriterResultDTO(
      bookCount: json['bookCount'],
      books: books,
    );
  }
}
