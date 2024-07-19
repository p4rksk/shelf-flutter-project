import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/store/darkmode.dart';


class DarkModeSettingsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    final darkModeNotifier = ref.read(darkModeProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text("다크 모드 설정"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "다크 모드",
              style: TextStyle(fontSize: 20),
            ),
            SwitchListTile(
              title: Text("다크 모드 사용"),
              value: isDarkMode,
              onChanged: (value) {
                darkModeNotifier.toggleDarkMode(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
