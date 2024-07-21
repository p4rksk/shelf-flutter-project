import 'package:dio/dio.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';

class WishlistRepo {
  Future<WishBook> fetchBookData(String token, int bookId) async {
    final response = await dio.get(
      '/app/books/$bookId',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    logger.d(response.data);
    if (response.statusCode == 200) {
      return WishBook.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to load home data');
    }
  }
}
