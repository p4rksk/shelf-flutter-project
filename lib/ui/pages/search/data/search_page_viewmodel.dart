import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/main.dart';
import 'package:shelf/ui/pages/search/data/author_result.dart';
import 'package:shelf/ui/pages/search/data/search_repo.dart';

// 창고 관리자
final searchPageProvider =
    StateNotifierProvider<SearchPageViewModel, SearchPageModel?>((ref) {
  return SearchPageViewModel(ref)..fetchAuthors();
});

// 창고
class SearchPageModel {
  List<AuthorResult> authors;

  SearchPageModel({
    required this.authors,
  });
}

// 창고 데이터
class SearchPageViewModel extends StateNotifier<SearchPageModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  SearchPageViewModel(this.ref) : super(null);

  Future<void> fetchAuthors() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    ResponseDTO responseDTO = await SearchRepo().fetchAuthors(sessionUser.jwt!);

    List<AuthorResult> authors = responseDTO.data;

    state = SearchPageModel(authors: authors);
  }
}
