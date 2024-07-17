import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/model/book/book_detail_dto.dart';
import 'package:shelf/data/store/session_store.dart';


// bookDetailProvider 정의하기
final bookDetailProvider = FutureProvider.family<BookDetailDTO, int>((ref, id) async {
  Logger().d("Fetching book details for book ID: $id");

  SessionUser sessionUser = ref.read(sessionProvider);
  ResponseDTO responseDTO = await BookDetailRepo().fetchBookDetails(sessionUser.jwt!, id);

  if (responseDTO.code == 200) {
    return responseDTO.data.first as BookDetailDTO;
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
        responseDTO.data = (responseDTO.data as List<dynamic>)
            .map((author) =>
                BookDetailDTO.fromJson(author as Map<String, dynamic>))
            .toList();

        return responseDTO;
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching authors: $e');
    }
  }
}
