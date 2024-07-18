import 'package:dio/dio.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/ui/pages/search/data/author_result.dart';

import '../../_core/constants/http.dart';

class SearchRepo {
  Future<ResponseDTO> fetchAuthors(String token) async {
    try {
      final response = await dio.get(
        '/app/search',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);
        responseDTO.data = (responseDTO.data as List<dynamic>)
            .map((author) =>
                AuthorResult.fromJson(author as Map<String, dynamic>))
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
