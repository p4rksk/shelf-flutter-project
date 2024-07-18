import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/data/store/session_store.dart';
import '../../../../../_core/constants/size.dart';
import '../../../../../_core/constants/style.dart';
import '../../../../_core/constants/move.dart';

class LogoutButton extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.read(sessionProvider.notifier);

    return TextButton(
      onPressed: () {
        ref.read(sessionProvider.notifier).logout();
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 1, top: 1, left: gap_s, right: gap_s),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.all(Radius.circular(gap_s)),
        ),
        child: Text("로그아웃", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}