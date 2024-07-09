import 'package:flutter/material.dart';

class AuthorButtons extends StatelessWidget {
  final List<String> authors = [
    '이병훈',
    '김유림',
    '이서윤 ',
    '김서형',
    '유발하라리',
    '강준혁',
    '박영선',
    '김성훈',
    '장하리',
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
          itemCount: authors.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                // Implement author selection
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
                child: Text('#' + authors[index],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),),
              ),
            );
          },
        ),
      ],
    );
  }
}
