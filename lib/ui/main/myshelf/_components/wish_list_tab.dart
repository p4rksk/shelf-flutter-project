import 'package:flutter/material.dart';
import 'package:shelf/data/model/myshelf/my_shelf_dto.dart';
import 'package:shelf/ui/main/myshelf/_components/wishlist_item.dart';

import '../../../../_core/constants/size.dart';

class WishlistTab extends StatelessWidget {
  final List<WishBook> wishList;

  const WishlistTab({
    required this.wishList,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_m),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 16.0,
        children: wishList.map((book) {
          return WishlistItem(book: book);
        }).toList(),
      ),
    );
  }
}
