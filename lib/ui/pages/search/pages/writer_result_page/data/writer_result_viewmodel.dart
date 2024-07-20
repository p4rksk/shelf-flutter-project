import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/pages/search/pages/writer_result_page/data/writer_result_repo.dart';

import '../../../../../../main.dart';
import 'writer_result_model.dart';

// 창고 관리자
final writerResultProvider = StateNotifierProvider.family<WriterResultViewmodel,
    WriterResultModel?, String>((ref, authorName) {
  return WriterResultViewmodel(ref, authorName)..loadWriterResultData();
});

// 창고
class WriterResultModel {
  final WriterResultDTO writerResultDTO;

  const WriterResultModel({
    required this.writerResultDTO,
  });
}

// 창고 데이터
class WriterResultViewmodel extends StateNotifier<WriterResultModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  final String authorName;

  WriterResultViewmodel(this.ref, this.authorName) : super(null);

  Future<void> loadWriterResultData() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    WriterResultDTO writerResultDTO = await WriterResultRepo()
        .fetchBooksByAuthor(sessionUser.jwt!, authorName);

    state = WriterResultModel(writerResultDTO: writerResultDTO);
  }
}
