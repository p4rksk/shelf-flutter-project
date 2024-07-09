import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/constants.dart';

class BottomActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey[300]!,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: ElevatedButton.icon(
              onPressed: () {
                // Add action for adding to library
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: kAccentColor1,
                backgroundColor: Colors.white,
                side: BorderSide(color: kAccentColor1, width: 1),
                minimumSize: Size(double.infinity, 50),
              ),
              icon: Icon(Icons.library_add, color: kAccentColor1),
              label: Text(
                '서재에 담기',
                style: TextStyle(color: kAccentColor1),
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                // Add action for reading
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: kAccentColor1,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('바로 읽기'),
            ),
          ),
        ],
      ),
    );
  }
}
