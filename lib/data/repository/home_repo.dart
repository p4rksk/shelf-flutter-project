import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/model/home/home_page_dto.dart';
import 'package:shelf/data/store/session_store.dart';

final homeDataProvider = FutureProvider.autoDispose<HomeData>((ref) async {
  final sessionUser = await ref.watch(sessionProvider);


  if (sessionUser.jwt == null) {
    throw Exception('JWT is null');
  }

  final homeRepo = ref.watch(homeRepoProvider);
  return await homeRepo.fetchHomeData(sessionUser.jwt!);
  }


);

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
        Logger().d(homeData);

        return homeData;
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching homeDatas: $e');
    }
  }
}
