import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/style.dart';
import 'package:shelf/_core/constants/http.dart';

class WriterAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? writerName;

  WriterAppBar({
    required this.writerName,
  });

  @override
  Size get preferredSize => Size.fromHeight(40);

  @override
  Widget build(BuildContext context) {
    logger.d(writerName);

    return PreferredSize(
      preferredSize: Size.fromHeight(40),
      child: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "#" + writerName!,
          style: h6(),
        ),
      ),
    );
  }
}
