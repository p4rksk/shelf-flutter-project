class SessionUser {
  int id;
  bool status;
  DateTime? createdAt;

  SessionUser({
    required this.id,
    required this.status,
    this.createdAt,
  });

  factory SessionUser.fromJson(Map<String, dynamic> json) {
    return SessionUser(
      id: json["id"],
      status: json["status"],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }
}
