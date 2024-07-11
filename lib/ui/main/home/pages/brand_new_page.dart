import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/data/model/home/book_detail_data.dart';

class BrandNewPage extends StatefulWidget {
  @override
  _BrandNewPageState createState() => _BrandNewPageState();
}

class _BrandNewPageState extends State<BrandNewPage> {
  DateTime selectedMonth = DateTime(2024, 10);

  List<Book> getBooksForSelectedMonth() {
    return newBooks.where((book) {
      DateTime date = DateTime.parse(book.registrationDate);
      return date.year == selectedMonth.year && date.month == selectedMonth.month;
    }).toList();
  }

  Map<String, List<Book>> groupBooksByWeek(List<Book> books) {
    Map<String, List<Book>> groupedBooks = {};
    for (var book in books) {
      DateTime date = DateTime.parse(book.registrationDate);
      int weekNumber = ((date.day - 1) / 7).floor() + 1;
      String weekKey = '${selectedMonth.month}월 ${_weekNumberToKorean(weekNumber)}';
      if (groupedBooks[weekKey] == null) {
        groupedBooks[weekKey] = [];
      }
      groupedBooks[weekKey]!.add(book);
    }
    return groupedBooks;
  }

  String _weekNumberToKorean(int weekNumber) {
    switch (weekNumber) {
      case 1:
        return '첫째주';
      case 2:
        return '둘째주';
      case 3:
        return '셋째주';
      case 4:
        return '넷째주';
      case 5:
        return '다섯째주';
      default:
        return '${weekNumber}주';
    }
  }

  void nextMonth() {
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month + 1);
    });
  }

  void previousMonth() {
    setState(() {
      selectedMonth = DateTime(selectedMonth.year, selectedMonth.month - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final books = getBooksForSelectedMonth();
    final groupedBooks = groupBooksByWeek(books);

    return Scaffold(
      appBar: AppBar(
        title: Text('Brandnew'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: previousMonth,
                ),
                Text(
                  DateFormat('yyyy년 MM월').format(selectedMonth),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right),
                  onPressed: nextMonth,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: groupedBooks.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      entry.key,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: entry.value.length,
                        itemBuilder: (context, index) {
                          final book = entry.value[index];
                          return Container(
                            width: 150,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    book.imagePath,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  book.title,
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  book.author,
                                  style: TextStyle(fontSize: 14, color: Colors.grey),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
