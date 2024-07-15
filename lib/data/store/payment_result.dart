import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/mypage/payment.dart';
// 펼쳐보기
class PaymentState extends StateNotifier<bool> {
  PaymentState() : super(false);

  void toggle() {
    state = !state;
  }
}

final paymentStateProvider = StateNotifierProvider<PaymentState, bool>((ref) {
  return PaymentState();
});

// 구독 시작, 해지 토글
class SubscriptionStateNotifier extends StateNotifier<bool> {
  SubscriptionStateNotifier() : super(true);

  void toggle() {
    state = !state;
  }
}

final subscriptionStateProvider = StateNotifierProvider<SubscriptionStateNotifier, bool>((ref) {
  return SubscriptionStateNotifier();
});

// 기본 카드 설정
class DefaultCardNotifier extends ChangeNotifier {
  PaymentMethod _defaultCard;

  DefaultCardNotifier(this._defaultCard);

  PaymentMethod get defaultCard => _defaultCard;

  void setDefaultCard(PaymentMethod card) {
    _defaultCard = card;
    notifyListeners();
  }
}

final defaultCardProvider = ChangeNotifierProvider<DefaultCardNotifier>((ref) {
  return DefaultCardNotifier(paymentMethods[0]);
});