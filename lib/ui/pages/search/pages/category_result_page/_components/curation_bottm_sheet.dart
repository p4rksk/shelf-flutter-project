import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/_core/constants/style.dart';

class CurationBottomSheet extends StatefulWidget {
  final List<Map<String, String>> categories;
  final int selectedIndex;
  final ValueChanged<int> onCategorySelected;
  final VoidCallback onApply;

  CurationBottomSheet({
    required this.categories,
    required this.selectedIndex,
    required this.onCategorySelected,
    required this.onApply,
  });

  @override
  _CurationBottomSheetState createState() => _CurationBottomSheetState();
}

class _CurationBottomSheetState extends State<CurationBottomSheet> {
  int _curationIndex = 0;

  @override
  void initState() {
    super.initState();
    _curationIndex = widget.selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: Container(
        height: 400,
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              child: Text(
                "큐레이션 선택",
                style: h8(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 3.5 / 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 7,
                  ),
                  itemCount: widget.categories.length,
                  itemBuilder: (context, index) {
                    final String? category = widget.categories[index]['name'];
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _curationIndex = index;
                        });
                        widget.onCategorySelected(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          border: Border.all(
                            color: _curationIndex == index
                                ? kAccentColor4
                                : Color(0xFFE6E6E6),
                            width: 1.0,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(category!),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 50,
                        color: Color(0xffe6e6e6),
                        alignment: Alignment.center,
                        child: Text(
                          "닫기",
                          style: subtitle2(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: widget.onApply,
                      child: Container(
                        height: 50,
                        color: kAccentColor4,
                        child: Center(
                          child: Text(
                            "적용 하기",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
