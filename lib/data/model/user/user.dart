class User {
  int id;
  String email;
  String nickName;
  bool status;
  DateTime? createdAt;

  User({
    required this.id,
    required this.email,
    required this.nickName,
    required this.status,
    this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"],
      nickName: json["nickName"],
      status: json["status"] ?? false,
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "nickName": nickName,
      "status": status,
      "createdAt": createdAt?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, nickName: $nickName,  status: $status, createdAt: $createdAt}';
  }
}
