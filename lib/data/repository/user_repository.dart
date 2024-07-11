import 'package:dio/dio.dart';
import 'package:untitled/_core/constants/http.dart';
import 'package:untitled/data/dto/response_dto.dart';
import 'package:untitled/data/dto/user_request.dart';

class UserRepository {
  Future<ResponseDTO> fetchLogin(LoginReqDTO requestDTO) async {
    try {
      Response<dynamic> response =
          await dio.post<dynamic>("/login", data: requestDTO.toJson());

      print(response.data);

      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

      // responseDTO.data = User.fromJson(responseDTO.data);  <-- 응답값을 User로 받는 작업

      final jwt = response.headers["Authorization"];

      if (jwt != null) {
        responseDTO.token = jwt.first;
      }

      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(-1, "유저네임 혹은 비번이 틀렸습니다", null);
    }
  }
}
