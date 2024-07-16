import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/line.dart';
import 'package:shelf/data/model/category/category_list.dart';
import 'package:shelf/data/model/home/book_detail_data.dart';
import 'package:shelf/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/_components/back_arrow_appbar.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/_components/book_grid.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/_components/result_title.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/_components/sort_bottm_sheet.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/_components/sort_section.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/data/category_data.dart';

class CategoryResultPage extends StatefulWidget {
  late final String? categoryName;

  CategoryResultPage({this.categoryName});

  @override
  _CategoryResultPageState createState() => _CategoryResultPageState();
}

class _CategoryResultPageState extends State<CategoryResultPage> {
  late Future<CategoryResult> _categoryResult;

  late String currentCategoryName;
  int _selectedIndex = 0;
  int _curationIndex = 0;
  String selectedSort = "완독할 확률 높은 순";
  List<Book> books = newBooks; // 초기 상태 설정
  // 초기 정렬 기준

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackArrowAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Column(
          children: [
            ResultTitle(
              // ~분야 모아보기 탭
              categories: categories,
              categoryName: widget.categoryName!,
              curationIndex: _curationIndex,
              applySelection: _applySelection,
            ),
            SizedBox(height: 10),
            greyLine1,
            SortSection(
              // 정렬 방식 선택
              bookCount: books.length,
              selectedSort: selectedSort,
              onSortTap: () {
                _showSortBottomSheet(context);
              },
            ),
            BookGrid(
              // 검색 결과 아이템들
              books: books,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ModifiedBottomNavigator(
        selectedIndex: _selectedIndex,
      ),
    );
  }

  // 내부 메소드=========================================

  void _applySelection(String selectedCategoryName) {
    setState(() {
      widget.categoryName = selectedCategoryName;
      // 여기서 categoryName 검색 로직
    });
  }

  void _applySort(String selectedCategoryName) {
    setState(() {
      widget.categoryName = selectedCategoryName;
      // 여기서 sort 정렬 로직
    });
  }

  void _showSortBottomSheet(BuildContext context) {
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
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
