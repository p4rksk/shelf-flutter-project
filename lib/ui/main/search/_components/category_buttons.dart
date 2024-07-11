import 'package:flutter/material.dart';
import 'package:untitled/data/model/category_page/category_list.dart';
import 'package:untitled/ui/main/search/pages/category_result_page/category_result_page.dart';

class CategoryButtons extends StatelessWidget {
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
              mainAxisSpacing: 10,
              crossAxisSpacing: 8.0,
              childAspectRatio: 4,
            ),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                onPressed: () {
                  // Implement category selection
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoryResultPage(
                        categoryName: categories[index]['name']!,
                      ),
                    ),
                  );
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
