import 'package:flutter/material.dart';

class SearchResultItem extends StatelessWidget {
  final int index;

  SearchResultItem({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.search),
      title: Text('Result $index'),
      subtitle: Text('Subtitle for result $index'),
      onTap: () {
        // Handle item tap
      },
    );
  }
}
