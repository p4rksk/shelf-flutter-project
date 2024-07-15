// 1. 창고 데이터
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:untitled/_core/constants/move.dart';
import 'package:untitled/data/dto/response_dto.dart';
import 'package:untitled/data/model/user/user.dart';
import 'package:untitled/data/model/user/user_request.dart';
import 'package:untitled/data/repository/user_repo.dart';
import 'package:untitled/main.dart';

class SessionUser {
  User? user;
  String? jwt;
  bool isLogin;

  SessionUser({
    this.user,
    this.jwt,
    this.isLogin = false,
  });
}

var logger = Logger();

// 2. 창고
class SessionStore extends StateNotifier<SessionUser> {
  final UserRepo userRepository;
  SessionStore(this.userRepository) : super(SessionUser());

  // 1. 화면 context에 접근하는 법
  final mContext = navigatorKey.currentContext;

  Future<void> join(JoinReqDTO joinReqDTO) async {
    // 1. 통신 코드
    ResponseDTO responseDTO = await userRepository.fetchJoin(joinReqDTO);
    // 2. 비지니스 로직
    if (responseDTO.code == 200) {
      state = SessionUser(
          user: responseDTO.data, isLogin: true, jwt: responseDTO.token);
      logger.d(responseDTO.toString());
      Navigator.pushNamed(mContext!, Move.homePage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }

  Future<void> login(LoginReqDTO reqDTO) async {
    ResponseDTO responseDTO = await userRepository.fetchLogin(reqDTO);
    if (responseDTO.code == 200) {
      state = SessionUser(
          user: responseDTO.data, isLogin: true, jwt: responseDTO.token);
      Navigator.pushNamed(mContext!, Move.homePage);
    } else {
      ScaffoldMessenger.of(mContext!)
          .showSnackBar(SnackBar(content: Text(responseDTO.msg)));
    }
  }

  void logout(BuildContext context) {
    state = SessionUser(); // 초기화하여 로그아웃 처리
    Navigator.popAndPushNamed(context, Move.startViewPage);
  }
// 1. 화면 context에 접근하는 법
}

// 3. 창고 관리자
final sessionProvider = StateNotifierProvider<SessionStore, SessionUser>((ref) {
  return SessionStore(UserRepo());
});
