import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/_core/constants/style.dart';

class WriterSortSection extends StatelessWidget {
  final int bookCount;
  final VoidCallback onSortTap;
  final String selectedSort;

  const WriterSortSection({
    Key? key,
    required this.bookCount,
    required this.onSortTap,
    required this.selectedSort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Text(
              "총 ${bookCount}권",
              style: h8(),
            ),
          ),
          InkWell(
            child: Container(
              child: Row(
                children: [
                  Text(
                    selectedSort,
                    style: plainText(),
                  ),
                  SizedBox(width: 5),
                  SvgPicture.asset(
                    'assets/icon/system/arrow_down_sharp.svg',
                    height: 10,
                    width: 10,
                  )
                ],
              ),
            ),
            onTap: onSortTap,
          ),
        ],
      ),
    );
  }
}
