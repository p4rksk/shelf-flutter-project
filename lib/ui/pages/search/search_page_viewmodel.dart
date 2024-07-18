import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/dto/response_dto.dart';
import 'package:shelf/data/repository/search_repo.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/main.dart';
import 'package:shelf/ui/pages/search/data/author_result.dart';

// 창고관리자
final searchPageProvider =
    StateNotifierProvider<SearchPageViewModel, SearchPageModel?>((ref) {
  return SearchPageViewModel(ref);
});

// 창고데이터
class SearchPageModel {
  List<AuthorResult> authors;
  bool isLoading;

  SearchPageModel({
    required this.authors,
    this.isLoading = false,
  });
}

// 창고
class SearchPageViewModel extends StateNotifier<SearchPageModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  final refreshCtrl = RefreshController();

  SearchPageViewModel(this.ref)
      : super(SearchPageModel(authors: [], isLoading: true));

  Future<void> fetchAuthors() async {
    state = SearchPageModel(authors: state!.authors, isLoading: true);

    SessionUser sessionUser = ref.read(sessionProvider);

    try {
      ResponseDTO responseDTO =
          await SearchRepo().fetchAuthors(sessionUser.jwt as String);

      List<AuthorResult> authors = responseDTO.data;

      state = SearchPageModel(authors: authors, isLoading: false);
    } catch (e) {
      state = SearchPageModel(authors: [], isLoading: false);
      logger.e("Error fetching authors: $e");
    } finally {
      refreshCtrl.refreshCompleted();
    }
  }
}
