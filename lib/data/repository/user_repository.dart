import 'package:dio/dio.dart';
import 'package:untitled/_core/constants/http.dart';
import 'package:untitled/data/dto/response_dto.dart';
import 'package:untitled/data/model/user/user_request.dart';

import '../model/user/user_response.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    try {
      // dynamic -> http body
      Response<dynamic> response =
          await dio.post("/user/join", data: requestDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      responseDTO.data = SessionUser.fromJson(responseDTO.data);
      logger.d(responseDTO.data);

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(code: -1, msg: "중복되는 유저명입니다");
    }
  }

  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      Response<dynamic> response =
          await dio.post("/user/login", data: requestDTO.toJson());

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      responseDTO.data = SessionUser.fromJson(responseDTO.data);

      logger.d(responseDTO.data);
      return responseDTO;
    } catch (e) {
      return ResponseDTO(code: -1, msg: "유저네임 혹은 비번이 틀렸습니다");
    }
  }
}
