import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/store/session_store.dart';

import 'writer_result_model.dart';

final writerResultProvider = Provider((ref) => WriterResultRepo());

final writerSearchProvider =
    FutureProvider.family<WriterResultDTO, String>((ref, authorName) async {
  final repository = ref.read(writerResultProvider);
  final session = ref.read(sessionProvider);
  return repository.fetchBooksByAuthor(session.jwt!, authorName);
});

class WriterResultRepo {
  final Dio _dio = Dio();

  Future<WriterResultDTO> fetchBooksByAuthor(
      String token, String authorName) async {
    final response = await _dio.get(
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
