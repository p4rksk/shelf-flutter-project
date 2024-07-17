import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/size.dart';
import 'package:shelf/data/model/myshelf/my_shelf_dto.dart';
import 'package:shelf/ui/main/home/_components/myshelf_history_section.dart';
import 'package:shelf/ui/main/myshelf/_components/read_book_section.dart';

class BookListTab extends StatelessWidget {
  final List<BookList> bookList;

  BookListTab({required this.bookList});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: gap_m),
        ),
        SliverToBoxAdapter(
          child: MyshelfHistorySection(historyBooks: bookList[0].historyList),
        ),
        SliverToBoxAdapter(
          child: Divider(),
        ),
        SliverToBoxAdapter(
          child: ReadBooksSection(
            allBook: bookList[0].allBook,
          ),
        ),
      ],
    );
  }
}
