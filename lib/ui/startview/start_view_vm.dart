import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/main.dart';

class StartViewModel {}

class StartViewViewModel extends StateNotifier<StartViewModel?> {
  final mContext = navigatorKey.currentContext;

  StartViewViewModel(super.state);
}

final StartViewProvider =
    StateNotifierProvider<StartViewViewModel, StartViewModel?>((ref) {
  return StartViewViewModel(null); // 초기 상태를 null로 설정하고, 데이터 로딩을 시작합니다.
});
