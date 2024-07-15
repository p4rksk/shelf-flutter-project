import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/_core/constants/size.dart';
import '../../../../data/model/home/home_page_data.dart';
import '../../../../data/store/bestseller_provider.dart';

class BestSellerDetailPage extends ConsumerWidget {
  final List<String> categories = ['종합', '소설', '경제/경영', '자기계발', '시/에세이', '인문/교양'];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final filteredBooks = ref.watch(filteredBooksProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('전체 베스트셀러'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: categories.map((category) {
                  final isSelected = selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      ref.read(categoryProvider.notifier).state = category;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                      margin: EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey),
                        color: isSelected ? kAccentColor3 : Colors.transparent,
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: filteredBooks.length,
        itemBuilder: (context, index) {
          RankBook book = filteredBooks[index];
          final categoryRank = index + 1;

          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Image.asset(book.imagePath, width: 120, height: 120),
                Container(
                  width: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$categoryRank',
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black38,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(book.author),
                      if (selectedCategory != '종합')
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: gap_s),
                            Text(
                              '종합 순위 ${book.rank}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
