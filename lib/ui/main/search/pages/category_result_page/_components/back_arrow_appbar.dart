import 'package:flutter/material.dart';

class BackArrowAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BackArrowAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(Icons.arrow_back),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40);
}
