import 'package:flutter/material.dart';
import 'package:untitled/_core/constants/size.dart';
import 'package:untitled/_core/constants/style.dart';
import 'package:untitled/data/model/home/home_page_data.dart' as data;
import '../../../../_core/constants/constants.dart';
import '../../../../data/model/home/home_page_data.dart';

class TopPicksSection extends StatefulWidget {
  @override
  _TopPicksSectionState createState() => _TopPicksSectionState();
}

class _TopPicksSectionState extends State<TopPicksSection> {
  ScrollController _scrollController = ScrollController();
  final double _itemExtent = 140.0;
  bool _isAutoScrolling = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_itemExtent * books.length);
    });
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() async {
    if (_isAutoScrolling) return;

    if (_scrollController.position.pixels <= _scrollController.position.minScrollExtent) {
      _isAutoScrolling = true;
      await _scrollController.animateTo(
        _scrollController.position.maxScrollExtent - _itemExtent,
        duration: Duration(milliseconds: 1),
        curve: Curves.easeOut,
      );
      _isAutoScrolling = false;
    } else if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - _itemExtent) {
      _isAutoScrolling = true;
      await _scrollController.animateTo(
        _itemExtent,
        duration: Duration(milliseconds: 1),
        curve: Curves.easeOut,
      );
      _isAutoScrolling = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 460,
      child: Stack(
        children: [
          ClipPath(
            clipper: TopPicksClipper(),
            child: Container(
              color: kAccentColor3,
              height: 350,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: gap_xxxl),
                Text(
                  'Our Top Picks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: gap_xl),
                Container(
                  height: 270,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification notification) {
                      if (notification is ScrollEndNotification) {
                        _onScroll();
                      }
                      setState(() {});
                      return true;
                    },
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: books.length * 3,
                      itemBuilder: (context, index) {
                        final book = books[index % books.length];
                        double scale = 1.0;
                        if (_scrollController.hasClients) {
                          double itemOffset = index * _itemExtent; // 각 아이템의 위치
                          double viewportCenter = _scrollController.offset + MediaQuery.of(context).size.width / 2;
                          double diff = (itemOffset - viewportCenter + _itemExtent / 2).abs();
                          scale = (1 - (diff / 400)).clamp(0.8, 1.0);
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              double targetOffset = index * _itemExtent - (MediaQuery.of(context).size.width / 2) + _itemExtent / 2;
                              _scrollController.animateTo(
                                targetOffset,
                                duration: Duration(seconds: 1),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Transform.scale(
                              scale: scale,
                              child: BookCard(book: book, isFocused: scale > 0.9),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final Book book;
  final bool isFocused;

  BookCard({required this.book, required this.isFocused});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 120,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(book.imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          book.title,
          style: TextStyle(
            color: isFocused ? Colors.black87 : Colors.grey,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          book.author,
          style: TextStyle(
            color: isFocused ? Colors.black54 : Colors.grey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class TopPicksClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80); // 높이 조정
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
