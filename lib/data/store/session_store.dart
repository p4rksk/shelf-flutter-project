// 1. 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/_core/constants/move.dart';
import 'package:untitled/data/dto/response_dto.dart';
import 'package:untitled/data/dto/user_request.dart';
import 'package:untitled/data/model/user.dart';
import 'package:untitled/data/repository/user_repository.dart';
import 'package:untitled/main.dart';

class SessionUser {
  User? user;
  String? jwt;
  bool isLogin;
  SessionUser({this.user, this.jwt, this.isLogin = false});
}

// 2. 창고
class SessionStore extends SessionUser {
  // 1. 화면 context에 접근하는 법
  final mContext = navigatorKey.currentContext;

  Future<void> join(JoinReqDTO joinReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await UserRepository().fetchJoin(joinReqDTO);

    // 2. 비지니스 로직
    if (responseDTO.code == 1) {
      Navigator.pushNamed(mContext!, Move.homePage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }

  // JWT는 로그아웃할 때 서버측으로 요청할 필요가 없음.
}

// 3. 창고 관리자
final sessionProvider = Provider<SessionStore>((ref) {
  return SessionStore();
});
