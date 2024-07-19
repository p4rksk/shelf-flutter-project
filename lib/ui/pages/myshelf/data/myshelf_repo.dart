import 'package:dio/dio.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';

class MyShelfRepo {
  final Dio dio;

  const MyShelfRepo({
    required this.dio,
  });

  Future<MyShelfModel> fetchMyShelfData(String token) async {
    final response = await dio.get(
      '/app/user/my-library',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
      ),
    );

    if (response.statusCode == 200) {
      return MyShelfModel.fromJson(response.data['data']);
    } else {
      throw Exception('Failed to load home data');
    }
  }
}
