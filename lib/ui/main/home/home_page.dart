import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/repository/home_repo.dart';
import 'package:shelf/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:shelf/ui/main/home/_components/best_seller_section.dart';
import 'package:shelf/ui/main/home/_components/book_of_the_day_section.dart';
import 'package:shelf/ui/main/home/_components/top_pick_section.dart';

import '_components/history_section.dart';

class HomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeDataProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: homeData.when(
        data: (data) => SingleChildScrollView(
          child: Column(
            children: [
              TopPicksSection(books: data.bestSellers),
              HistorySection(historyBooks: data.bookHistory),
              BookOfTheDaySection(book: data.dayBestSeller),
              BestSellerSection(books: data.weekBestSellers),
            ],
          ),
        ),
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('hello: $error')),
      ),
      bottomNavigationBar: ModifiedBottomNavigator(
        selectedIndex: 0,
      ),
    );
  }
}
