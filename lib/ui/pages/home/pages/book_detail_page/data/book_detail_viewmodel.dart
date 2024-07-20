import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/main.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_model.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_repo.dart';

final bookDetailProvider =
    StateNotifierProvider.family<BookDetailViewmodel, BookDetailModel?, int>(
        (ref, id) {
  return BookDetailViewmodel(ref, id)..loadBookDetail();
});

class BookDetailModel {
  final BookDetailDTO bookDetailDTO;

  const BookDetailModel({
    required this.bookDetailDTO,
  });
}

class BookDetailViewmodel extends StateNotifier<BookDetailModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  final int id;

  BookDetailViewmodel(this.ref, this.id) : super(null);

  Future<void> loadBookDetail() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    BookDetailDTO bookDetailDTO =
        await BookDetailRepo().fetchBookDetails(sessionUser.jwt!, id);
    state = BookDetailModel(bookDetailDTO: bookDetailDTO);
  }
}
