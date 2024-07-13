import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/data/store/session_store.dart';
import 'package:untitled/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:untitled/ui/main/mypage/_components/logout_button.dart';
import 'package:untitled/ui/main/mypage/_components/lower_component.dart';

import '_components/upper_component.dart';

class MyPage extends ConsumerWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int _selectedIndex = 3;
    final session = ref.watch(sessionProvider);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            UpperComponent(name: session.user?.nickName ?? 'Unknown'),
            LowerComponent(),
            LogoutButton(),
          ],
        ),
      ),
      bottomNavigationBar: ModifiedBottomNavigator(
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
