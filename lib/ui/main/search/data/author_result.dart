class AuthorResult {
  final int authorId;
  final String authorName;

  AuthorResult({
    required this.authorId,
    required this.authorName,
  });

  factory AuthorResult.fromJson(Map<String, dynamic> json) {
    return AuthorResult(
      authorId: json['authorId'],
      authorName: json['authorName'],
    );
  }
}
