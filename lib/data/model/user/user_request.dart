class JoinReqDTO {
  final String email;
  final String nickName;
  final String password;

  const JoinReqDTO({
    required this.email,
    required this.nickName,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "password": this.password,
      "nickName": this.nickName,
    };
  }
}

class LoginReqDTO {
  final String email;
  final String password;

  LoginReqDTO({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "password": this.password,
    };
  }
}
