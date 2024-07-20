import 'package:dio/dio.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_model.dart';

// bookDetailProvider 정의하기

class BookDetailRepo {
  Future<BookDetailDTO> fetchBookDetails(String token, int id) async {
    try {
      final response = await dio.get(
        '/app/book/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

        return BookDetailDTO.fromJson(responseDTO.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching authors: $e');
    }
  }
}
