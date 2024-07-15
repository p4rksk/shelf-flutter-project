import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:shelf/ui/main/search/_components/author_buttons.dart';
import 'package:shelf/ui/main/search/_components/category_buttons.dart';
import 'package:shelf/ui/main/search/_components/custom_drawer.dart';
import 'package:shelf/ui/main/search/_components/search_bar.dart';
import 'package:shelf/ui/main/search/search_page_viewmodel.dart';

class SearchPage extends ConsumerWidget {
  String? _selectedOption;
  final int _selectedIndex = 1;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // searchPageProvider 상태를 구독
    final viewModel = ref.read(searchPageProvider.notifier);
    final searchPageModel = ref.watch(searchPageProvider);

    // 페이지 로드 시 fetchAuthors 호출
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (searchPageModel!.authors.isEmpty) {
        viewModel.fetchAuthors();
      }
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              color: Colors.white, // Set the background color here
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBarV2(),
                  SizedBox(height: 16.0),
                  CategoryButtons(),
                  SizedBox(height: 16.0),
                  if (searchPageModel != null)
                    AuthorButtons(
                      authorResults: searchPageModel.authors,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ModifiedBottomNavigator(
        selectedIndex: _selectedIndex,
      ),
      endDrawer: CustomDrawer(
        selectedOption: _selectedOption,
        onOptionChanged: (String? newValue) {
          _selectedOption = newValue;
        },
      ),
    );
  }
}
