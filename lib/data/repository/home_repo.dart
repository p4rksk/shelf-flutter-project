import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/model/home/home_page_dto.dart';
import 'package:shelf/data/store/session_store.dart';

final homeDataProvider = FutureProvider<HomeData>((ref) async {
  SessionUser sessionUser = ref.read(sessionProvider);
  ResponseDTO responseDTO = await HomeRepo().fetchHomeData(sessionUser.jwt!);

  if (responseDTO.code == 200) {
    return responseDTO.data.first as HomeData;
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

      if (response.statusCode == 200) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        responseDTO.data = (responseDTO.data as List<dynamic>)
            .map((homeData) =>
                HomeData.fromJson(homeData as Map<String, dynamic>))
            .toList();

        return responseDTO;
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching homeDatas: $e');
    }
  }
}
