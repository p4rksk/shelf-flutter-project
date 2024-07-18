import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_viewmodel.dart';

final wishlistProvider =
    StateNotifierProvider<WishlistNotifier, Set<BookDetailDTO>>((ref) {
  return WishlistNotifier();
});

class WishlistNotifier extends StateNotifier<Set<BookDetailDTO>> {
  WishlistNotifier() : super({});

  void toggleWishlist(BookDetailDTO book) {
    if (state.contains(book)) {
      state = {...state}..remove(book);
    } else {
      state = {...state}..add(book);
    }
  }
}
