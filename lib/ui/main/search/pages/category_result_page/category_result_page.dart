import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/_core/constants/line.dart';
import 'package:untitled/_core/constants/style.dart';
import 'package:untitled/data/model/category_page/category_list.dart';
import 'package:untitled/data/model/category_page/category_page_data.dart';
import 'package:untitled/ui/common/components/custom_bottom_navigation_bar.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/back_arrow_appbar.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/book_grid.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/result_title.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/sort_bottm_sheet.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/sort_section.dart';

import 'data/category_data.dart';

class CategoryResultPage extends StatefulWidget {
  final String? categoryName;

  @override
  State<CategoryResultPage> createState() => _CategoryResultPageState();

  CategoryResultPage({
    this.categoryName,
  });
}

class _CategoryResultPageState extends State<CategoryResultPage> {
  late String currentCategoryName;
  int _selectedIndex = 0;
  int _curationIndex = 0;
  String selectedSort = "완독할 확률 높은 순"; // 초기 정렬 기준

  @override
  void initState() {
    super.initState();
    currentCategoryName = widget.categoryName!; // 초기 상태 설정
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
              categoryName: currentCategoryName,
              categories: categories,
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
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
      ),
    );
  }


  // 내부 메소드=========================================

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _applySelection(String selectedCategoryName) {
    setState(() {
      currentCategoryName = selectedCategoryName;
      // 여기서 categoryName 검색 로직
    });
  }

  void _applySort(String selectedCategoryName) {
    setState(() {
      currentCategoryName = selectedCategoryName;
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

