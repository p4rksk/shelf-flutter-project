// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../../../../data/model/home/brandnew_dto.dart';
// import '../../../../data/repository/brandnew_repo.dart';
//
// class BrandnewModel {
//
// }
//
// final brandNewDataProvider = FutureProvider<BrandNewRespDTO>((ref) async {
//   final repo = BrandnewRepo(baseUrl: 'https://api.yourserver.com');
//   return await repo.fetchBrandNewData();
// });
//
//
// final selectedMonthProvider = StateProvider<DateTime>((ref) {
//   return DateTime(2024, 10);
// });
//
//
// final booksProvider = Provider<List<BrandNewList>>((ref) {
//   final selectedMonth = ref.watch(selectedMonthProvider);
//   final asyncBrandNewData = ref.watch(brandNewDataProvider);
//
//   return asyncBrandNewData.when(
//     data: (data) {
//       return data.brandNewList.where((book) {
//         DateTime date = DateTime.parse(book.registrationDate);
//         return date.year == selectedMonth.year && date.month == selectedMonth.month;
//       }).toList();
//     },
//     loading: () => [],
//     error: (_, __) => [],
//   );
// });
//
// // Provider for grouping books by week
// final groupedBooksProvider = Provider<Map<String, List<BrandNewList>>>((ref) {
//   final books = ref.watch(booksProvider);
//   final selectedMonth = ref.watch(selectedMonthProvider);
//
//   Map<String, List<BrandNewList>> groupedBooks = {};
//   for (var book in books) {
//     DateTime date = DateTime.parse(book.registrationDate);
//     int weekNumber = ((date.day - 1) / 7).floor() + 1;
//     String weekKey = '${selectedMonth.month}월 ${_weekNumberToKorean(weekNumber)}';
//     if (groupedBooks[weekKey] == null) {
//       groupedBooks[weekKey] = [];
//     }
//     groupedBooks[weekKey]!.add(book);
//   }
//   return groupedBooks;
// });
//
// String _weekNumberToKorean(int weekNumber) {
//   switch (weekNumber) {
//     case 1:
//       return '첫째주';
//     case 2:
//       return '둘째주';
//     case 3:
//       return '셋째주';
//     case 4:
//       return '넷째주';
//     case 5:
//       return '다섯째주';
//     default:
//       return '${weekNumber}주';
//   }
// }