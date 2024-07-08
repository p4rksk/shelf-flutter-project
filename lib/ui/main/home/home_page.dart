import 'package:flutter/material.dart';
import '_components/history_section.dart';
import '_components/top_pick_section.dart';

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
