import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/size.dart';
import '../../../../data/model/myshelf/my_shelf_data.dart';

class ReviewItem extends StatelessWidget {
  final MyReview review;

  ReviewItem({required this.review});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: gap_m, right: gap_m, bottom: gap_m),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: gap_xxs),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                review.bookImagePath,
                width: 100,
                height: 150,
                fit: BoxFit.cover,
              ),
              SizedBox(width: gap_m),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.bookTitle,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                    ),
                    Text(
                      review.bookAuthor,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    SizedBox(height: gap_m),
                    Text(
                      review.reviewContent,
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: gap_xs),
                    Text(
                      review.date,
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}