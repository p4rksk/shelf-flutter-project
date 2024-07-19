import 'package:flutter/material.dart';
import 'package:shelf/ui/pages/home/widgets/myshelf_history_book_card.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';

class MyshelfHistorySection extends StatelessWidget {
  final List<HistoryBook> historyBooks;

  const MyshelfHistorySection({
    required this.historyBooks,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 40),
          child: Text(
            '히스토리',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: historyBooks.length,
            itemBuilder: (context, index) {
              final book = historyBooks[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: MyShelfHistoryBookCard(historyBook: book),
              );
            },
          ),
        ),
      ],
    );
  }
}
