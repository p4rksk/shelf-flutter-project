import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/home/book_detail_data.dart';

final wishlistProvider = StateNotifierProvider<WishlistNotifier, Set<Book>>((ref) {
  return WishlistNotifier();
});

class WishlistNotifier extends StateNotifier<Set<Book>> {
  WishlistNotifier() : super({});

  void toggleWishlist(Book book) {
    if (state.contains(book)) {
      state = {...state}..remove(book);
    } else {
      state = {...state}..add(book);
    }
  }
}