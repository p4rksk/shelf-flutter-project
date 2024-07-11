import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:untitled/data/model/home/book_detail_data.dart';

// 상태 관리 클래스
class BookState extends StateNotifier<DateTime> {
  BookState() : super(DateTime(2024, 10));

  void nextMonth() {
    state = DateTime(state.year, state.month + 1);
  }

  void previousMonth() {
    state = DateTime(state.year, state.month - 1);
  }

  List<Book> getBooksForSelectedMonth(List<Book> books) {
    return books.where((book) {
      DateTime date = DateTime.parse(book.registrationDate);
      return date.year == state.year && date.month == state.month;
    }).toList();
  }

  Map<String, List<Book>> groupBooksByWeek(List<Book> books) {
    Map<String, List<Book>> groupedBooks = {};
    for (var book in books) {
      DateTime date = DateTime.parse(book.registrationDate);
      int weekNumber = ((date.day - 1) / 7).floor() + 1;
      String weekKey = '${state.month}월 ${_weekNumberToKorean(weekNumber)}';
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
}

final bookProvider = StateNotifierProvider<BookState, DateTime>((ref) {
  return BookState();
});
