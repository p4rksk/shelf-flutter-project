class AuthorDetail {
  final int id;
  final String name;
  final String authorIntro;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AuthorDetail({
    required this.id,
    required this.name,
    required this.authorIntro,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AuthorDetail.fromJson(Map<String, dynamic> json) {
    return AuthorDetail(
      id: json["id"],
      name: json["name"],
      authorIntro: json["authorIntro"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
//
}
