import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/_core/constants/size.dart';
import '../../../../_core/constants/constants.dart';
import '../../../../data/model/mypage/payment.dart';
import '../../../../data/store/payment_result.dart';

final defaultCardProvider = StateProvider<int?>((ref) => null);

class PaymentManagementPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = ref.watch(paymentStateProvider);
    final paymentStateNotifier = ref.read(paymentStateProvider.notifier);

    final isSubscribed = ref.watch(subscriptionStateProvider);
    final subscriptionStateNotifier = ref.read(subscriptionStateProvider.notifier);

    final defaultCardIndex = ref.watch(defaultCardProvider);
    final defaultCardNotifier = ref.read(defaultCardProvider.notifier);

    void _showSubscriptionAlert(bool isSubscribed, String paymentInfo) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(isSubscribed ? '구독 해지' : '구독 시작'),
            content: Text(isSubscribed
                ? '$paymentInfo\n구독을 해지하시겠습니까?'
                : '$paymentInfo\n구독을 시작하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () {
                  subscriptionStateNotifier.toggle();
                  Navigator.of(context).pop();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(isSubscribed ? '구독이 해지되었습니다.' : '구독이 시작되었습니다.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
                child: Text('예'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('아니오'),
              ),
            ],
          );
        },
      );
    }

    final paymentInfo = defaultCardIndex != null && paymentMethods.isNotEmpty
        ? '${paymentMethods[defaultCardIndex].bankName} ${paymentMethods[defaultCardIndex].cardNumber}'
        : '결제 정보 없음';

    void _removeCard(int index) {
      paymentMethods.removeAt(index);
      if (paymentMethods.length == 1) {
        defaultCardNotifier.state = 0; // 카드가 하나만 남으면 그 카드를 기본 카드로 설정
      } else if (defaultCardIndex == index) {
        defaultCardNotifier.state = null; // 기본 카드가 삭제되면 초기화시킴
      } else if (defaultCardIndex != null && defaultCardIndex! > index) {
        defaultCardNotifier.state = defaultCardIndex! - 1; // 삭제된 카드가 기본 카드 이전에 있으면 조정
      }
      ref.refresh(paymentStateProvider); // 강제로 UI 업데이트
    }

    void _addCard() {
    }

    return Scaffold(
      backgroundColor: TColor.white,
      appBar: AppBar(
        backgroundColor: TColor.white,
        title: Text('구독관리'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 30, bottom: 20),
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Text(
                '결제 수단등록',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            ...paymentMethods.asMap().entries.map((entry) {
              int index = entry.key;
              PaymentMethod method = entry.value;
              return Container(
                margin: EdgeInsets.symmetric(horizontal: gap_l, vertical: 5),
                padding: EdgeInsets.all(gap_m),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      method.cardImagePath,
                      width: 60,
                      height: 40,
                    ),
                    SizedBox(width: gap_m),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          method.bankName,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          method.cardNumber,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '등록일: ${method.registrationDate}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        if (defaultCardIndex == index)
                          Text(
                            '기본 카드',
                            style: TextStyle(
                              fontSize: 14,
                              color: kAccentColor1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () => _removeCard(index),
                          child: Text(
                            '카드 삭제하기',
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                        if (defaultCardIndex != index)
                          TextButton(
                            onPressed: () => defaultCardNotifier.state = index,
                            child: Text(
                              '기본 카드로 설정',
                              style: TextStyle(color: Colors.black54),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _addCard(),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: gap_l, vertical: 5),
                padding: EdgeInsets.all(gap_m),
                decoration: BoxDecoration(
                  color: kAccentColor1.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(gap_m),
                ),
                child: Center(
                  child: Text(
                    '+ 카드 추가하기',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: gap_xxl),
            // 구독 해지하기
            Container(
              margin: EdgeInsets.only(left: gap_l, right: gap_l),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isSubscribed ? '구독 해지하기' : '구독 시작하기',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Switch(
                    value: isSubscribed,
                    activeColor: kAccentColor1,
                    inactiveThumbColor: Colors.grey,
                    inactiveTrackColor: Colors.grey[300],
                    onChanged: (value) => _showSubscriptionAlert(isSubscribed, paymentInfo),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Text(
                '결제 내역',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(gap_m),
              width: double.infinity,
              height: 70,
              child: Text(
                '전체 ${paymentHistory.length}건',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: isExpanded ? paymentHistory.length : 1,
              itemBuilder: (context, index) {
                final payment = paymentHistory[index];
                return Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.symmetric(horizontal: gap_l, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        payment.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '구독기간',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '결제 상태',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '결제일(사용일)',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  '결제 금액',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${payment.subscriptionPeriod}개월 구독',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  payment.status,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  payment.date,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  payment.amount,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: kAccentColor1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            if (paymentHistory.length > 1)
              GestureDetector(
                onTap: () => paymentStateNotifier.toggle(),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isExpanded ? '접기' : '펼쳐보기',
                        style: TextStyle(
                          fontSize: 16,
                          color: kAccentColor1,
                        ),
                      ),
                      Icon(
                        isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: kAccentColor1,
                      ),
                    ],
                  ),
                ),
              ),
            SizedBox(height: gap_l),
          ],
        ),
      ),
    );
  }
}
