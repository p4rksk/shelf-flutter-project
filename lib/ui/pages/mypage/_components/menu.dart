import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../_core/constants/constants.dart';
import '../../../../_core/constants/line.dart';
import '../../../../_core/constants/style.dart';

class Menu extends StatelessWidget {
  String? title;

  Menu(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${title}',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: CupertinoColors.systemGrey2,
                  size: 20,
                ),
              ],
            ),
          ),
          line4,
        ],
      ),
    );
  }
}
