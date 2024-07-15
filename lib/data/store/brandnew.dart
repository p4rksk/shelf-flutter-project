import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/model/home/book_detail_data.dart';

final selectedMonthProvider = StateProvider<DateTime>((ref) {
  return DateTime(2024, 10);
});

final booksProvider = Provider<List<Book>>((ref) {
  final selectedMonth = ref.watch(selectedMonthProvider);
  return newBooks.where((book) {
    DateTime date = DateTime.parse(book.registrationDate);
    return date.year == selectedMonth.year && date.month == selectedMonth.month;
  }).toList();
});

final groupedBooksProvider = Provider<Map<String, List<Book>>>((ref) {
  final books = ref.watch(booksProvider);
  final selectedMonth = ref.watch(selectedMonthProvider);

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
});

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
