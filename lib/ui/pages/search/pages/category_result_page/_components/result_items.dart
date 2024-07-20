import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/ui/pages/search/pages/category_result_page/data/category_result_viewmodel.dart';

class ResultItem extends ConsumerWidget {
  final String categoryName;

  const ResultItem({
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryResultData = ref.watch(categoryResultProvider(categoryName));

    return categoryResultData == null
        ? Center(child: CircularProgressIndicator())
        : Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 0,
              ),
              itemCount: categoryResultData.categoryResultDTO.books.length,
              itemBuilder: (context, index) {
                final book = categoryResultData.categoryResultDTO.books[index];
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
                            book.bookPath,
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
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
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
                );
              },
            ),
          );
  }
}
