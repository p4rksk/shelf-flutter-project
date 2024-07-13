import 'package:flutter/material.dart';
import 'package:untitled/ui/common/components/modified_bottom_navigation_bar.dart';
import 'package:untitled/ui/main/search/_components/author_buttons.dart';
import 'package:untitled/ui/main/search/_components/category_buttons.dart';
import 'package:untitled/ui/main/search/_components/custom_drawer.dart';
import 'package:untitled/ui/main/search/_components/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? _selectedOption;
  final int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
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
                  AuthorButtons(),
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
          setState(
            () {
              _selectedOption = newValue;
            },
          );
        },
      ),
    );
  }
}
