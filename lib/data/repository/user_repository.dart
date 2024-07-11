import 'package:dio/dio.dart';
import 'package:untitled/_core/constants/http.dart';
import 'package:untitled/data/dto/response_dto.dart';
import 'package:untitled/data/dto/user_request.dart';

class UserRepository {
  Future<ResponseDTO> fetchJoin(JoinReqDTO requestDTO) async {
    try {
      // dynamic -> http body
      Response<dynamic> response =
          await dio.post("/user/join", data: requestDTO.toJson());
      ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
      //responseDTO.data = User.fromJson(responseDTO.data);
      logger.d(responseDTO.data);
      return responseDTO;
    } catch (e) {
      // 200이 아니면 catch로 감
      return ResponseDTO(-1, "중복되는 유저명입니다", null);
    }
  }
}
