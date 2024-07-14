import 'package:flutter/material.dart';
import 'package:untitled/ui/main/search/data/author_result.dart';
import 'package:untitled/ui/main/search/pages/writer_result_page/writer_result_page.dart';

class AuthorButtons extends StatelessWidget {
  final List<AuthorResult> authorResults;

  const AuthorButtons({
    required this.authorResults,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          '작가별 책 모아보기',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15,
            childAspectRatio: 4,
            mainAxisExtent: 50,
          ),
          itemCount: authorResults.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WriterResultPage(
                        authorName: authorResults[index].authorName),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // 배경색 설정
                foregroundColor: Colors.black, // 텍스트 색상 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0), // borderRadius 설정
                  side: BorderSide(
                    color: Color(0xFFE6E6E6), // border 색상 설정
                    width: 1.0, // border 두께 설정
                  ),
                ),
                shadowColor: Colors.transparent,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '#' + authorResults[index].authorName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
