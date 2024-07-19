import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/_core/constants/size.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/book_detail_page.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_model.dart';

class ReadBooksSection extends StatelessWidget {
  final List<AllBook> allBook;

  const ReadBooksSection({
    required this.allBook,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(gap_m),
          child: Text(
            '전체도서',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 20),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150,
              crossAxisSpacing: 13,
              mainAxisSpacing: gap_m,
              childAspectRatio: 0.6,
            ),
            itemCount: allBook.length,
            itemBuilder: (context, index) {
              final book = allBook[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookDetailPage(bookId: book.id),
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(baseURL + book.bookImagePath),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    book.bookTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    book.author,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
