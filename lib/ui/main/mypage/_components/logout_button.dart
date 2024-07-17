import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/data/store/session_store.dart';

class LogoutButton extends ConsumerWidget {


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: FilledButton(
        onPressed: () {
          ref.read(sessionProvider.notifier).logout();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              CupertinoColors.systemGrey2), // 버튼 배경 색상
          foregroundColor:
          MaterialStateProperty.all<Color>(Colors.white),
          shape: MaterialStateProperty.all<
              RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius:
              BorderRadius.circular(5.0), // 원하는 반경 값 설정
            ),
          ),
        ),
        child: Text('로그아웃',
          style: TextStyle(
              fontWeight: FontWeight.w600
          ),),
      ),
    );
  }
}
