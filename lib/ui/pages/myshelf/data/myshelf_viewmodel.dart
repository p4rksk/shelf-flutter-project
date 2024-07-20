import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/main.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_repo.dart';

// 창고관리자
final myShelfDataProvider =
    StateNotifierProvider<MyShelfViewModel, MyShelfModel?>((ref) {
  return MyShelfViewModel(ref)..loadMyShelfData();
});

// 창고 데이터
class MyShelfModel {
  MyShelfData myShelfData;

  MyShelfModel({
    required this.myShelfData,
  });
}

// 창고
class MyShelfViewModel extends StateNotifier<MyShelfModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  MyShelfViewModel(this.ref) : super(null);

  Future<void> loadMyShelfData() async {
    SessionUser sessionUser = ref.read(sessionProvider);

    MyShelfData myShelfData =
        await MyShelfRepo().fetchMyShelfData(sessionUser.jwt!);
    state = MyShelfModel(myShelfData: myShelfData);
  }
}
