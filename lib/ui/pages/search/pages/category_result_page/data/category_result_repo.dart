import 'package:dio/dio.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/ui/pages/search/pages/category_result_page/data/category_result_model.dart';

class CategoryResultRepo {
  Future<CategoryResultDTO> fetchBooksByCategory(
      String token, String categoryName) async {
    final response = await dio.get('/app/book/search',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
        queryParameters: {"category": categoryName});

    if (response.statusCode == 200) {
      return CategoryResultDTO.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to load books');
    }
  }
}
