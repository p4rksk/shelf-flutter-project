import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/home/home_page_data.dart';

final categoryProvider = StateProvider<String>((ref) => '종합');

final filteredBooksProvider = Provider<List<RankBook>>((ref) {
  final category = ref.watch(categoryProvider);
  return dummyBooks.where((book) => book.category == category || category == '종합').toList();
});

final tabControllerProvider = Provider.autoDispose.family<TabController, int>((ref, length) {
  final tickerProvider = TickerProviderContainer(ref);
  final tabController = TabController(length: length, vsync: tickerProvider);
  ref.onDispose(tabController.dispose);
  return tabController;
});

class TickerProviderContainer implements TickerProvider {
  TickerProviderContainer(this.ref);
  final Ref ref;

  @override
  Ticker createTicker(TickerCallback onTick) {
    final ticker = Ticker(onTick);
    ref.onDispose(ticker.dispose);
    return ticker;
  }
}