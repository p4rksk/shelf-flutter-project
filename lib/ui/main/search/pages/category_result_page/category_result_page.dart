import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/_core/constants/line.dart';
import 'package:untitled/_core/constants/style.dart';
import 'package:untitled/data/model/category_page/category_list.dart';
import 'package:untitled/data/model/category_page/category_page_data.dart';
import 'package:untitled/ui/common/components/custom_bottom_navigation_bar.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/back_arrow_appbar.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/curation_bottm_sheet.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/_components/sort_bottm_sheet.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/data/category_data.dart';

class CategoryResultPage extends StatefulWidget {
  @override
  State<CategoryResultPage> createState() => _CategoryResultPageState();
}

class _CategoryResultPageState extends State<CategoryResultPage> {
  String? categoryName = "인문";
  int _selectedIndex = 0;
  int _curationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BackArrowAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        color: Colors.white,
        child: Column(
          children: [
            InkWell(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      "${categoryName}분야 모아보기",
                      style: h5(),
                    ),
                  ),
                  SizedBox(width: 10),
                  SvgPicture.asset(
                    "assets/icon/system/arrow_down.svg",
                    height: 15,
                    width: 15,
                  )
                ],
              ),
              onTap: () {
                // drawer 사용
                _showCurationBottomSheet(context);
              },
            ),
            SizedBox(height: 10),
            greyLine1,
            Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "총 5권",
                      style: h8(),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      child: Row(
                        children: [
                          Text(
                            "완독할 확률 높은 순",
                            style: plainText(),
                          ),
                          SizedBox(width: 5),
                          SvgPicture.asset(
                            'assets/icon/system/arrow_down_sharp.svg',
                            height: 10,
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      // draw 기능
                      _showSortBottomSheet(context);
                    },
                  ),
                ],
              ),
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

  void _applySelection() {
    setState(() {
      categoryName = categories[_curationIndex]['name'];
      // 여기서 categoryName 검색 로직
    });
  }

  void _showCurationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CurationBottomSheet(
          categories: categories,
          selectedIndex: _curationIndex,
          onCategorySelected: (index) {
            setState(() {
              _curationIndex = index;
            });
          },
          onApply: () {
            _applySelection();
            Navigator.pop(context);
          },
        );
      },
    );
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
            });
          },
          onApply: () {
            _applySelection();
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
