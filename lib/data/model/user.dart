class User {
  int id;
  String email;
  String nickName;

  User({
    required this.id,
    required this.nickName,
    required this.email,
  });

  // 1. Dart 객체를 통신을 위한 Map 형태로 변환합니다.
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": nickName,
        "email": email,
      };

  // 2. Map 형태로 받아서 Dart 객체로 변환합니다.
  User.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        nickName = json["nickName"],
        email = json["email"];

  @override
  String toString() {
    return 'User{id: $id, username: $nickName, email: $email}';
  }
}
