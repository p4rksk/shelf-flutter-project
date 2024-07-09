import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/size.dart';
import '../../../../data/model/home/book_detail_data.dart';
import 'package:untitled/_core/constants/constants.dart';

class BookIntroductionTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_l),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookDetail.oneLineSummary,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              '내용 소개',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildCollapsibleSection(bookDetail.introduction),
            SizedBox(height: 20),
            Text(
              '작가 소개',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildCollapsibleSection(bookDetail.authorIntroduction),
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
