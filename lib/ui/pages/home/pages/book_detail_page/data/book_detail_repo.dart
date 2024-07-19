import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/model/book/book_detail_dto.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_viewmodel.dart';

// bookDetailProvider 정의하기
final bookDetailProvider =
    FutureProvider.family<BookDetailDTO, int>((ref, id) async {
  SessionUser sessionUser = ref.read(sessionProvider);

  ResponseDTO responseDTO =
      await BookDetailRepo().fetchBookDetails(sessionUser.jwt!, id);

  if (responseDTO.code == 200) {
    return responseDTO.data as BookDetailDTO;
  } else {
    throw Exception('Failed to load book details: ${responseDTO.msg}');
  }
});

class BookDetailRepo {
  Future<ResponseDTO> fetchBookDetails(String token, int id) async {
    try {
      final response = await dio.get(
        '/app/book/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

        responseDTO.data =
            BookDetailDTO.fromJson(responseDTO.data as Map<String, dynamic>);
        return responseDTO;
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching authors: $e');
    }
  }
}
