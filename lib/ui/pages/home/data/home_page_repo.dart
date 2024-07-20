import 'package:dio/dio.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/ui/pages/home/data/home_page_model.dart';

class HomeRepo {
  Future<HomeData> fetchHomeData(String token) async {
    try {
      final response = await dio.get(
        '/app/main',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        // 여기에 data 파싱을 위한 코드 추가
        final data = response.data['data'] as Map<String, dynamic>;
        final homeData = HomeData.fromJson(data);

        return homeData;
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching homeDatas: $e');
    }
  }
}
