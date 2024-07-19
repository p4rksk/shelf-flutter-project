import 'package:dio/dio.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';

class MyShelfRepo {
  MyShelfRepo();

  Future<MyShelfData> fetchMyShelfData(String token) async {
    final response = await dio.get(
      '/app/user/my-library',
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
