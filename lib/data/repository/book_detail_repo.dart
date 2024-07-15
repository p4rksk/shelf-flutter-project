import 'package:dio/dio.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/model/book_detail/book_detail_dto.dart';

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
