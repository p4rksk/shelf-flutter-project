import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelf/_core/constants/line.dart';
import 'package:shelf/_core/constants/style.dart';
import 'package:shelf/ui/pages/search/pages/category_result_page/_components/result_items.dart';

class SortByMenu extends StatelessWidget {
  final String? categoryName;
  final VoidCallback? onCurationTap;
  final VoidCallback? onSortTap;

  SortByMenu({
    this.categoryName,
    this.onCurationTap,
    this.onSortTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Column(
        children: [
          InkWell(
            child: Row(
              children: [
                Container(
                  child: Text(
                    "${categoryName}분야 모아보기",
                    style: h5(),
                  ),
                ),
                SizedBox(width: 10),
                SvgPicture.asset(
                  "assets/icon/system/arrow_down.svg",
                  height: 15,
                  width: 15,
                )
              ],
            ),
            onTap: onCurationTap,
          ),
          SizedBox(height: 10),
          greyLine1,
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "총 5권",
                    style: h8(),
                  ),
                ),
                InkWell(
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "완독할 확률 높은 순",
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
          ),
          ResultItem(categoryName: categoryName!),
        ],
      ),
    );
  }
}
