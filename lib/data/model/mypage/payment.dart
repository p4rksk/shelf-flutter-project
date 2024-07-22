class Payment {
  final String title;
  final String date;
  final String status;
  final String amount;
  final int subscriptionPeriod;

  Payment({
    required this.title,
    required this.date,
    required this.status,
    required this.amount,
    required this.subscriptionPeriod,
  });
}

final List<Payment> paymentHistory = [
  Payment(
    title: '전자책 월 정기구독',
    date: '2023-07-14',
    status: '결제 완료',
    amount: '9,900원',
    subscriptionPeriod: 1,
  ),
  Payment(
    title: '전자책 월 정기구독',
    date: '2023-06-14',
    status: '결제 완료',
    amount: '9,900원',
    subscriptionPeriod: 1,
  ),
  Payment(
    title: '전자책 월 정기구독',
    date: '2023-05-14',
    status: '결제 완료',
    amount: '9,900원',
    subscriptionPeriod: 1,
  ),
];

class PaymentMethod {
  final String bankName;
  final String cardNumber;
  final String registrationDate;
  final String cardImagePath;

  PaymentMethod({
    required this.bankName,
    required this.cardNumber,
    required this.registrationDate,
    required this.cardImagePath,
  });
}

final List<PaymentMethod> paymentMethods = [
  PaymentMethod(
    bankName: '국민',
    cardNumber: '1234 - **** - **** - 1212',
    registrationDate: '2024-07-14',
    cardImagePath: 'assets/images/card.png',
  ),
  // PaymentMethod(
  //   bankName: '신한',
  //   cardNumber: '5678 - **** - **** - 5678',
  //   registrationDate: '2024-07-15',
  //   cardImagePath: 'assets/images/card.png',
  // ),
];
