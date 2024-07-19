import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_repo.dart';

// 창고관리자
final myShelfDataProvider =
    StateNotifierProvider<MyShelfViewModel, MyShelfModel?>((ref) {
  return MyShelfViewModel(ref: ref)..loadMyShelfData();
});

// 창고 데이터
class MyShelfModel {
  MyShelfData myShelfData;
  bool isLoading;

  MyShelfModel({
    required this.myShelfData,
    required this.isLoading,
  });
}

// 창고
class MyShelfViewModel extends StateNotifier<MyShelfModel?> {
  final Ref ref;
  final refreshCtrl = RefreshController();

  MyShelfViewModel({required this.ref})
      : super(MyShelfModel(
            myShelfData: MyShelfData(
              bookList: [],
              wishList: [],
            ),
            isLoading: true));

  Future<void> loadMyShelfData() async {
    state = MyShelfModel(myShelfData: state!.myShelfData, isLoading: true);
    SessionUser sessionUser = ref.read(sessionProvider);

    try {
      MyShelfData myShelfData =
          await MyShelfRepo().fetchMyShelfData(sessionUser.jwt!);
      state = MyShelfModel(myShelfData: myShelfData, isLoading: false);
    } catch (e) {
      state = MyShelfModel(myShelfData: state!.myShelfData, isLoading: false);
    }
  }
}
