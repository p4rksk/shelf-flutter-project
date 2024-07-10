import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/size.dart';
import 'package:untitled/ui/main/myshelf/_components/read_book_section.dart';
import '../../home/_components/history_section.dart';


class BookListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(height: gap_m),
        ),
        SliverToBoxAdapter(
          child: HistorySection(),
        ),
        SliverToBoxAdapter(
          child: Divider(),
        ),
        SliverToBoxAdapter(
          child: ReadBooksSection(),
        ),
      ],
    );
  }
}
