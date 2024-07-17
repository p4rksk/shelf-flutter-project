import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/model/home/home_page_dto.dart';
import 'package:shelf/data/store/session_store.dart';

final homeDataProvider = FutureProvider<HomeData>((ref) async {
  SessionUser sessionUser = ref.read(sessionProvider);
  Logger().d("👉👉👉👉 ${sessionUser.jwt}");
  ResponseDTO responseDTO = await HomeRepo().fetchHomeData(sessionUser.jwt!);

  if (responseDTO.code == 200) {
    return responseDTO.data as HomeData;
  } else {
    throw Exception('Failed to load book details: ${responseDTO.msg}');
  }
});

class HomeRepo {
  Future<ResponseDTO> fetchHomeData(String token) async {
    try {
      final response = await dio.get(
        '/app/main',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      Logger().d(response.data);

      if (response.statusCode == 200) {
        // 여기에 data 파싱을 위한 코드 추가
        final data = response.data['data'] as Map<String, dynamic>;
        final homeData = HomeData.fromJson(data);

        return ResponseDTO(
          code: response.data['code'],
          msg: response.data['msg'],
          data: homeData,
        );
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching homeDatas: $e');
    }
  }
}
