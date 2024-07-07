import 'package:flutter/material.dart';
import 'components/top_pick_section.dart';
import 'components/history_section.dart'; // 히스토리 섹션 import

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopPicksSection(),
            HistorySection(),
            Container(
              height: 400,
              child: Center(
                child: Text('홈'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
