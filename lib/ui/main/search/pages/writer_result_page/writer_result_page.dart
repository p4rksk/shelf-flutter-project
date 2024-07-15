import 'package:flutter/material.dart';
import 'package:shelf/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/_components/sort_bottm_sheet.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/data/category_data.dart';
import 'package:shelf/ui/main/search/pages/writer_result_page/_components/writer_appbar.dart';
import 'package:shelf/ui/main/search/pages/writer_result_page/_components/writer_book_grid.dart';
import 'package:shelf/ui/main/search/pages/writer_result_page/_components/writer_sort_section.dart';

import '../../../../../data/model/category_page/category_page_data.dart';

class WriterResultPage extends StatefulWidget {
  String? authorName;

  @override
  State<WriterResultPage> createState() => _WriterResultPageState();

  WriterResultPage({
    this.authorName,
  });
}

class _WriterResultPageState extends State<WriterResultPage> {
  String selectedSort = "완독할 확률 높은 순";
  int _selectedIndex = 0;
  int _curationIndex = 0;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: WriterAppBar(writerName: widget.authorName),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Column(
          children: [
            WriterSortSection(
              // 총 몇권 -- 정렬순 섹션
              bookCount: books.length,
              selectedSort: selectedSort,
              onSortTap: () {
                _showResultSort(context);
              },
            ),
            WriterBookGrid(
              // 검색된 아이템 그리드 뷰
              books: books,
            )
          ],
        ),
      ),
      bottomNavigationBar: ModifiedBottomNavigator(
        selectedIndex: _selectedIndex,
      ),
    );
  }

  // 내부 메소드 ======================================
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showResultSort(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SortBottmSheet(
          sortBy: sortBy,
          selectedIndex: _curationIndex,
          onSortSelected: (index) {
            setState(() {
              _curationIndex = index;
              selectedSort = sortBy[index]['name']!;
            });
          },
          onApply: () {
            // TODO : 정렬 기능 넣기
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
