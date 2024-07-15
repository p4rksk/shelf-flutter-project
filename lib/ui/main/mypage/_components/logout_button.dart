import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/data/store/session_store.dart';

class LogoutButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.read(sessionProvider.notifier);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: FilledButton(
        onPressed: () {
          // '구독 상품 살펴보기' 기능
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              CupertinoColors.systemGrey2), // 버튼 배경 색상
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0), // 원하는 반경 값 설정
            ),
          ),
        ),
        child: InkWell(
          onTap: () {
            session.logout(context);
          },
          child: Text(
            '로그 아웃',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
