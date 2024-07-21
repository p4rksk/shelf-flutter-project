import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/_core/constants/size.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_model.dart';

class BookIntroductionTab extends StatelessWidget {
  final BookDetailDTO book;

  BookIntroductionTab({required this.book});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_l),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              book.bookIntro,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '내용 소개',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildCollapsibleSection(book.contentIntro),
            SizedBox(height: 20),
            Text(
              '작가 소개',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildCollapsibleSection(book.author.authorIntro),
          ],
        ),
      ),
    );
  }

  Widget _buildCollapsibleSection(String text) {
    bool isExpanded = false;

    return StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedCrossFade(
              firstChild: Text(
                text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              secondChild: Text(text),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: Duration(milliseconds: 200),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? '접어보기' : '펼쳐보기',
                style: TextStyle(color: TColor.primaryColor1),
              ),
            ),
          ],
        );
      },
    );
  }
}
