import 'package:dio/dio.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/ui/pages/search/pages/writer_result_page/data/writer_result_model.dart';

class WriterResultRepo {
  Future<WriterResultDTO> fetchBooksByAuthor(
      String token, String authorName) async {
    final response = await dio.get(
      '/app/book/search?author=$authorName',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      return WriterResultDTO.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to load books');
    }
  }
}
