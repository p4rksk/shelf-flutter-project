import 'package:flutter/material.dart';

class AuthorButtons extends StatelessWidget {
  final List<String> authors = [
    '이병훈',
    '김유림',
    '이서윤 김서형',
    '어른이 되기까지',
    '하늘로 태어나',
    '강준혁',
    '박영선',
    '기후 위크',
    '장하리 하부르타',
    '강수정'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Text(
          '작가의 책 모아보기',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 4,
          ),
          itemCount: authors.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                // Implement author selection
              },
              child: Text('#' + authors[index]),
            );
          },
        ),
      ],
    );
  }
}
