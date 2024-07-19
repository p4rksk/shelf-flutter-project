import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/model/home/home_page_dto.dart';
import 'package:shelf/ui/main/home/pages/book_detail_page/book_detail_page.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/size.dart';

class HistoryBookCard extends StatelessWidget {
  final BookHistoryDTO historyBook;

  const HistoryBookCard({
    required this.historyBook,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = '$baseURL${historyBook.bookImagePath}';

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 260,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(gap_s),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(width: 110),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        historyBook.bookTitle,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '이어보기 >',
                        style: TextStyle(
                          color: TColor.primaryColor1,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      LinearProgressIndicator(
                        value: historyBook.lastReadPage / historyBook.pageCount,
                        backgroundColor: Colors.grey[300],
                        color: TColor.primaryColor1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -20,
          left: 16,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      BookDetailPage(bookId: historyBook.bookId),
                ),
              );
            },
            child: Container(
              width: 80,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
