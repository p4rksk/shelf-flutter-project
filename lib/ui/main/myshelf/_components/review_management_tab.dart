import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/size.dart';
import '../../../../data/model/myshelf/my_shelf_data.dart';
import '../../home/widgets/review_item.dart';

class ReviewManagementTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(gap_s),
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: userData.reviews.length,
          itemBuilder: (context, index) {
            return ReviewItem(review: userData.reviews[index]);
          },
        ),
      ),
    );
  }
}

