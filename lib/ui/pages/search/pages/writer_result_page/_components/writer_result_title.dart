import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shelf/ui/pages/search/pages/category_result_page/_components/curation_bottm_sheet.dart';

import '../../../../../../_core/constants/style.dart';

class WriterResultTitle extends StatefulWidget {
  final String categoryName;
  final List<Map<String, String>> categories;
  final int curationIndex;
  final Function applySelection;

  const WriterResultTitle({
    Key? key,
    required this.categoryName,
    required this.categories,
    required this.curationIndex,
    required this.applySelection,
  }) : super(key: key);

  @override
  _WriterResultTitleState createState() => _WriterResultTitleState();
}

class _WriterResultTitleState extends State<WriterResultTitle> {
  late int _curationIndex;

  @override
  void initState() {
    super.initState();
    _curationIndex = widget.curationIndex;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        children: [
          Container(
            child: Text(
              "${widget.categoryName} 분야 모아보기",
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
      onTap: () {
        _showCurationBottomSheet(
            context, widget.categories, _curationIndex, widget.applySelection);
      },
    );
  }

  void _showCurationBottomSheet(
      BuildContext context,
      List<Map<String, String>> categories,
      int curationIndex,
      Function applySelection) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return CurationBottomSheet(
          categories: categories,
          selectedIndex: curationIndex,
          onCategorySelected: (index) {
            setState(() {
              _curationIndex = index;
            });
          },
          onApply: () {
            applySelection(categories[_curationIndex]['name']!);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
