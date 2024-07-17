import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/model/book/book_detail_dto.dart';

import '../model/home/book_detail_data.dart';


final wishlistProvider = StateNotifierProvider<WishlistNotifier, Set<BookDetailDTO>>((ref) {
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