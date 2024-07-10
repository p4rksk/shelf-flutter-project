import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/_core/constants/line.dart';
import 'package:untitled/_core/constants/style.dart';
import 'package:untitled/data/model/category_page/category_list.dart';
import 'package:untitled/data/model/category_page/category_page_data.dart';
import 'package:untitled/ui/common/components/custom_bottom_navigation_bar.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/back_arrow_appbar.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/result_title.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/sort_bottm_sheet.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/sort_section.dart';

import 'data/category_data.dart';

class CategoryResultPage extends StatefulWidget {
  @override
  State<CategoryResultPage> createState() => _CategoryResultPageState();
}

class _CategoryResultPageState extends State<CategoryResultPage> {
  String? categoryName = "인문";
  int _selectedIndex = 0;
  int _curationIndex = 0;
  String selectedSort = "완독할 확률 높은 순"; // 초기 정렬 기준

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
              categoryName: categoryName!,
              categories: categories,
              curationIndex: _curationIndex,
              applySelection: _applySelection,
            ),
            SizedBox(height: 10),
            greyLine1,
            SortSection(
              // 정렬 방식 선택
              bookCount: books.length,
              selectedSort: selectedSort, // 현재 선택된 정렬 기준 전달
              onSortTap: () {
                _showSortBottomSheet(context);
              },
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 0,
                ),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final book = books[index];
                  return Container(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            height: 160,
                            width: double.infinity,
                            child: Image.asset(
                              book.path,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            book.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Text(
                            '${book.author}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _applySelection(String selectedCategoryName) {
    setState(() {
      categoryName = selectedCategoryName;
      // 여기서 categoryName 검색 로직
    });
  }

  void _applySort(String selectedCategoryName) {
    setState(() {
      categoryName = selectedCategoryName;
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
