import 'package:flutter/material.dart';
import 'package:shelf/ui/main/search/pages/writer_result_page/data/writer_result_model.dart';

class WriterResultBookGrid extends StatelessWidget {
  final List<WriterResultBook> books;

  const WriterResultBookGrid({
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
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
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
