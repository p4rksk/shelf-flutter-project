import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/pages/search/pages/category_result_page/data/category_result_viewmodel.dart';

final categoryResultProvider = Provider((ref) => CategoryResultRepo());

final categorySearchProvider =
    FutureProvider.family<CategoryResultDTO, String>((ref, categoryName) async {
  final repository = ref.read(categoryResultProvider);
  final session = ref.read(sessionProvider);

  return repository.fetchBooksByCategory(session.jwt!, categoryName);
});

class CategoryResultRepo {
  final Dio _dio = Dio();

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
