class JoinReqDTO {
  final String email;
  final String nickName;
  final String password;
  final bool isAgreed;

  const JoinReqDTO({
    required this.email,
    required this.nickName,
    required this.password,
    required this.isAgreed,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "nickName": this.nickName,
      "password": this.password,
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
