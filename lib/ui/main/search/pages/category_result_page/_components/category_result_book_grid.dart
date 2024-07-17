import 'package:flutter/material.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/main/home/pages/book_detail_page/book_detail_page.dart';
import 'package:shelf/ui/main/search/pages/category_result_page/data/category_result_viewmodel.dart';

import '../../../../../../_core/constants/http.dart';

class CategoryResultBookGrid extends StatelessWidget {
  final List<CategoryResultBook> books;

  const CategoryResultBookGrid({
    required this.books,
  });

  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 0,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          var book = books[index];
          // logger.d(book);
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailPage(bookId: book.bookId),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Center(
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      child: Image.network(
                        baseURL+book.bookPath, // 이 부분은 유효한 이미지 URL로 변경되어야 합니다.
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      book.bookTitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Text(
                      '${book.author.authorName}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
