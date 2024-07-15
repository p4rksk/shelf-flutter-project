import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/model/book_detail/book_detail_dto.dart';
import 'package:shelf/data/repository/book_detail_repo.dart';
import 'package:shelf/data/store/session_store.dart';

// 창고관리자
final bookDetailProvider =
    StateNotifierProvider<BookDetailViewModel, BookDetailModel?>((ref) {
  return BookDetailViewModel(ref, null);
});

// 창고 데이터
class BookDetailModel {
  BookDetailDTO bookDetailDTO;

  BookDetailModel({
    required this.bookDetailDTO,
  });
}

// 창고
class BookDetailViewModel extends StateNotifier<BookDetailModel?> {
  final Ref ref;

  BookDetailViewModel(this.ref, BookDetailModel? state) : super(state);

  Future<void> notifyInit(BuildContext context, int id) async {
    Logger().d("notifyInit");

    SessionUser sessionUser = ref.read(sessionProvider);
    ResponseDTO responseDTO =
        await BookDetailRepo().fetchBookDetails(sessionUser.jwt!, id);

    if (responseDTO.code == 200) {
      state = BookDetailModel(bookDetailDTO: responseDTO.data);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("상세정보 로딩 실패 : ${responseDTO.msg}")));
    }
  }
}
