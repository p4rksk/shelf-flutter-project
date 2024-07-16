import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/_core/constants/size.dart';
import 'package:shelf/ui/main/search/data/author_result.dart';
import 'package:shelf/ui/main/search/pages/writer_result_page/writer_result_page.dart';

class AuthorButtons extends StatelessWidget {
  final List<AuthorResult> authorResults;

  const AuthorButtons({
    required this.authorResults,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: gap_l),
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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WriterResultPage(
                          authorName: authorResults[index].authorName),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), // borderRadius 설정
                    gradient: LinearGradient(
                      colors: [kAccentColor1, kAccentColor3],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: RichText(
                            text: TextSpan(
                              text: '#' + authorResults[index].authorName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: [Colors.blue, Colors.purple],
                                  ).createShader(
                                    Rect.fromLTWH(0, 0, 100, 20),
                                  ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}