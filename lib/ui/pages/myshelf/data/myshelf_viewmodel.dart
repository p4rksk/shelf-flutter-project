import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_repo.dart';

final myShelfDataProvider =
    StateNotifierProvider<MyShelfViewModel, MyShelfModel?>((ref) {
  final repository = MyShelfRepo(dio: dio); // Dio 인스턴스를 직접 전달
  final session = ref.read(sessionProvider); // sessionProvider에서 session 읽기
  return MyShelfViewModel(
    state: null,
    myshelfRepo: repository,
    token: session.jwt!,
  );
});

// MyShelfData의 상태를 관리하는 ViewModel
class MyShelfViewModel extends StateNotifier<MyShelfModel?> {
  final MyShelfRepo myshelfRepo;

  MyShelfViewModel({
    MyShelfModel? state,
    required this.myshelfRepo,
    required String token,
  }) : super(state) {
    _loadMyShelfData(token);
  }

  Future<void> _loadMyShelfData(String token) async {
    try {
      MyShelfModel data = await myshelfRepo.fetchMyShelfData(token);
      state = data;
    } catch (e) {
      print("Error loading MyShelfData: $e");
    }
  }
}
