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

  // 위시리스트 추가
  void addWishBook(WishBook book) {
    final currentState = state;
    if (currentState != null) {
      final updatedWishList = [...currentState.myShelfData.wishList, book];
      state = MyShelfModel(
        myShelfData:
            currentState.myShelfData.copyWith(wishList: updatedWishList),
      );
    }
  }

  void removeWishBook(int bookId) {
    final currentState = state;
    if (currentState != null) {
      final updatedWishList = currentState.myShelfData.wishList
          .where((book) => book.id != bookId)
          .toList();
      state = MyShelfModel(
        myShelfData:
            currentState.myShelfData.copyWith(wishList: updatedWishList),
      );
    }
  }

// void toggleWishBook(IsWish isWish) {
//   final currentState = state;
//   if (currentState != null) {
//     if (isWish.isWish) {
//       // WishBook 생성 예시 - 실제 데이터로 교체 필요
//       final newBook = WishBook(
//         id: isWish.bookId,
//         bookId: isWish.bookId,
//         bookImagePath: 'path/to/image',
//         bookTitle: 'Book Title',
//         author: 'Author Name',
//         createdAt: DateTime.now().toString(),
//       );
//       addWishBook(newBook);
//     } else {
//       removeWishBook(isWish.bookId);
//     }
//   }
// }
}
