class User {
  int id;
  String email;
  String nickName;
  String phone;
  String address;
  bool status;
  String provider;
  DateTime? createdAt;
  DateTime? updatedAt;

  User({
    required this.id,
    required this.email,
    required this.nickName,
    this.phone = "",
    this.address = "",
    this.status = false,
    this.provider = "",
    this.createdAt,
    this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      email: json["email"],
      nickName: json["nickName"],
      phone: json["phone"] ?? "",
      address: json["address"] ?? "",
      status: json["status"] ?? false,
      provider: json["provider"] ?? "",
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "nickName": nickName,
      "phone": phone,
      "address": address,
      "status": status,
      "provider": provider,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, nickName: $nickName, phone: $phone, address: $address, status: $status, provider: $provider, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}
