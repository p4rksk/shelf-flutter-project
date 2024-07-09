import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/_core/constants/line.dart';
import 'package:untitled/_core/constants/style.dart';
import 'package:untitled/data/model/category_page/category_page_data.dart';
import 'package:untitled/ui/common/components/custom_bottom_navigation_bar.dart';

class CategoryResultPage extends StatefulWidget {
  @override
  State<CategoryResultPage> createState() => _CategoryResultPageState();
}

class _CategoryResultPageState extends State<CategoryResultPage> {
  String? categoryName = "인문";
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40),
        child: AppBar(
          leading: Icon(Icons.arrow_back),
          backgroundColor: Colors.white,
        ),
      ),
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
                      "${categoryName}책 모아보기",
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
                curationBottomSheet(context);
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

  void curationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: Container(
            height: 500,
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  child: Text(
                    "큐레이션 선택",
                    style: h8(),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 0,
                    ),
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];
                      return Container(
                        child: ListTile(
                          leading: Icon(Icons.book),
                          title: Text('Option 1'),
                          onTap: () {
                            // Handle option 1 tap
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
