import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/pages/search/pages/category_result_page/data/category_result_model.dart';
import 'package:shelf/ui/pages/search/pages/category_result_page/data/category_result_repo.dart';

import '../../../../../../main.dart';

// 창고관리자
final categoryResultProvider = StateNotifierProvider.family<
    CategoryResultViewmodel, CategoryResultModel?, String>(
  (ref, categoryName) {
    return CategoryResultViewmodel(ref, categoryName)..loadCategoryResultData();
  },
);

// 창고
class CategoryResultModel {
  final CategoryResultDTO categoryResultDTO;

  const CategoryResultModel({
    required this.categoryResultDTO,
  });
}

// 창고 데이터
class CategoryResultViewmodel extends StateNotifier<CategoryResultModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;
  final String categoryName;

  CategoryResultViewmodel(this.ref, this.categoryName) : super(null);

  Future<void> loadCategoryResultData() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    CategoryResultDTO categoryResultDTO = await CategoryResultRepo()
        .fetchBooksByCategory(sessionUser.jwt!, categoryName);

    state = CategoryResultModel(categoryResultDTO: categoryResultDTO);
  }
}
