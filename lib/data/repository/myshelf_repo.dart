
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/model/myshelf/my_shelf_dto.dart';
import 'package:shelf/data/store/session_store.dart';

final myShelfRepoProvider = Provider((ref) => MyshelfRepo());

final myShelfDataProvider = FutureProvider.family<MyShelfData, String>((ref, categoryName) {
  final repository = ref.watch(myShelfRepoProvider);
  final session = ref.read(sessionProvider);
  return repository.fetchMyShelfData(session.jwt!);
});

class MyshelfRepo {
  final Dio _dio = Dio();

  Future<MyShelfData> fetchMyShelfData(String token) async {
    final response = await _dio.get('app/user/my-library',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      return MyShelfData.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to load home data');
    }
  }
}

