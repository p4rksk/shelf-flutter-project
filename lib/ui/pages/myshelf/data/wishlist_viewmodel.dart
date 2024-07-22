import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_viewmodel.dart';

final wishListProvider =
    StateNotifierProvider<WishlistViewmodel, WishListModel>((ref) {
  final initialWishList = ref.read(myShelfDataProvider)!.myShelfData.wishList;
  return WishlistViewmodel(ref, initialWishList);
});

class WishListModel {
  final List<WishBook> bookList;

  WishListModel({required this.bookList});

  WishListModel copyWith({List<WishBook>? bookList}) {
    return WishListModel(
      bookList: bookList ?? this.bookList,
    );
  }
}

class WishlistViewmodel extends StateNotifier<WishListModel> {
  final Ref ref;

  WishlistViewmodel(this.ref, List<WishBook> initialBookList)
      : super(WishListModel(bookList: initialBookList));

  void addBook(WishBook book) {
    state = state.copyWith(bookList: [...state.bookList, book]);
  }

  void removeBook(int bookId) {
    state = state.copyWith(
      bookList: state.bookList.where((book) => book.id != bookId).toList(),
    );
  }

  void updateBook(WishBook book) {
    state = state.copyWith(
      bookList: state.bookList.map((b) => b.id == book.id ? book : b).toList(),
    );
  }

  // Future<void> toggleBookWishStatus(IsWish isWish) async {
  //   SessionUser sessionUser = ref.read(sessionProvider);
  //
  //   if (isWish.isWish) {
  //     if (!state.bookList.any((book) => book.bookId == isWish.bookId)) {
  //       // Create a WishBook instance and add to the list
  //       // Assuming you have a method to fetch the details of the book using bookId
  //       final WishBook newBook = await WishlistRepo()
  //           .fetchBookData(sessionUser.jwt!, isWish.bookId!);
  //       addBook(newBook);
  //     }
  //   } else {
  //     // Remove book from wish list
  //     removeBook(isWish.bookId);
  //   }
  // }
}
