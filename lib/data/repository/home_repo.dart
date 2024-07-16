import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/model/home/home_page_dto.dart';

final homeDataProvider = FutureProvider<HomeData>((ref) async {
  final response = await Dio().get('your_api_endpoint_here');

  if (response.statusCode == 200) {
    return HomeData.fromJson(response.data['data']);
  } else {
    throw Exception('Failed to load home data');
  }
});
