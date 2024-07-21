import 'package:dio/dio.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_model.dart';

// bookDetailProvider 정의하기

class BookDetailRepo {
  // 책 상세정보 가져오기
  Future<BookDetailDTO> fetchBookDetails(String token, int id) async {
    try {
      final response = await dio.get(
        '/app/book/$id',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        ResponseDTO responseDTO = ResponseDTO.fromJson(response.data);

        return BookDetailDTO.fromJson(responseDTO.data as Map<String, dynamic>);
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching authors: $e');
    }
  }

  // 위시리스트 통신
  Future<IsWish> updateBookWishStatus(
      String token, int userId, int bookId) async {
    final response = await dio.post(
      '/app/wishlist/toggle',
      options: Options(
        headers: {'Authorization': 'Bearer $token'},
        validateStatus: (status) => true,
      ),
      data: {
        'userId': userId,
        'bookId': bookId,
      },
    );

    // 상태 코드가 200이 아닐 경우 예외 처리
    if (response.statusCode != 200) {
      throw Exception(
          'Failed to update wish status. Status code: ${response.statusCode}');
    }

    IsWish isWish = IsWish.fromJson(response.data['data']);

    // 서버 응답에서 데이터를 추출하여 BookDetailDTO 객체를 생성합니다.
    return isWish;
  }
}
