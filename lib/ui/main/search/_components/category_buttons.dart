import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  final List<String> categories = [
    '인문',
    '사회',
    '과학',
    '역사',
    '만화',
    '소설',
    '철학',
    '종교',
    '어린이',
    'IT · 예제'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '카테고리',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            childAspectRatio: 4,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ElevatedButton(
              onPressed: () {
                // Implement category selection
              },
              child: Text(categories[index]),
            );
          },
        ),
      ],
    );
  }
}
