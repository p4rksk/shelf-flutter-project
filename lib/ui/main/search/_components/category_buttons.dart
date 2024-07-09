import 'package:flutter/material.dart';

class CategoryButtons extends StatelessWidget {
  final List<Map<String, String>> categories = [
    {
      'name': '인문',
      'description': '인문학 관련 도서가 읽으면 엄청 재밌어 미칠것 같이 감동적입니다.',
      'image': 'assets/images/categories/human.png',
    },
    {
      'name': '사회',
      'description': '사회학 관련 도서',
      'image': 'assets/images/categories/society.png',
    },
    {
      'name': '과학',
      'description': '과학 관련 도서',
      'image': 'assets/images/categories/science.png',
    },
    {
      'name': '역사',
      'description': '역사 관련 도서',
      'image': 'assets/images/categories/history.png',
    },
    {
      'name': '만화',
      'description': '만화책',
      'image': 'assets/images/categories/cartoon.png',
    },
    {
      'name': '소설',
      'description': '소설책',
      'image': 'assets/images/categories/novel.png',
    },
    {
      'name': '철학',
      'description': '철학 관련 도서',
      'image': 'assets/images/categories/philosophy.png',
    },
    {
      'name': '종교',
      'description': '종교 관련 도서',
      'image': 'assets/images/categories/religion.png',
    },
    {
      'name': '어린이',
      'description': '어린이 도서',
      'image': 'assets/images/categories/children.png',
    },
    {
      'name': 'IT · 예제',
      'description': 'IT 및 예제 관련 도서',
      'image': 'assets/images/categories/it.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '카테고리',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 8.0,
              childAspectRatio: 4,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  // Implement category selection
                },
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      side: BorderSide(color: Color(0xFFE6E6E6), width: 1.0),
                    ),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                categories[index]['name']!,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                categories[index]['description']!,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                            ),
                          child: Container(
                            height: double.infinity,
                            width: 300, // 부모 높이를 모두 채우도록 설정
                            child: Image.asset(
                              categories[index]['image']!,
                              width: 80,
                              height: double.infinity,
                              fit: BoxFit.cover, // 부모를 초과하는 경우 잘라냄
                            ),
                          ),
                        ),
                      ),
                    ],
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
