import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/model/home/home_page_dto.dart';
import '../../../../data/model/home/home_page_data.dart';

class BookOfTheDayCard extends StatelessWidget {
  final DayBestSellerDTO book;

  BookOfTheDayCard({required this.book});

  @override
  Widget build(BuildContext context) {
    final imageUrl = '$baseURL${book.bookImagePath}';


    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 250,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: kAccentColor5,
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
      child: Row(
        children: [
          Container(
            width: 150,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.purpleAccent.withOpacity(0.1),
                  Colors.blue.withOpacity(0.3),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        book.bookTitle,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {
                          // Add to wishlist action
                        },
                      ),
                    ],
                  ),
                  Text(
                    book.author,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    book.bookIntro,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
