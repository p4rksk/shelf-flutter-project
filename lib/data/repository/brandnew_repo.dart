import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:shelf/_core/constants/http.dart';

import '../dto/response_dto.dart';
import '../model/home/brandnew_dto.dart';

class BrandnewRepo {

  Future<ResponseDTO> fetchBrandNewData() async {
    final response = await dio.get("/app/book/new", queryParameters: {'month': DateFormat('yyyy-MM').format(DateTime.now())});

    ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

    if (response.statusCode == 200) {
      List<dynamic> prevList = responseDTO.data;
      List<BrandNewRespDTO> brandNewList = prevList.map((i) => BrandNewRespDTO.fromJson(i)).toList();

      responseDTO.data = brandNewList;

      return responseDTO;
    } else {
      throw Exception('Failed to load brand new data');
    }
  }

}