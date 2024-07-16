import 'package:flutter/material.dart';
import 'package:shelf/_core/constants/size.dart';
import '../../../../_core/constants/constants.dart';
import '../../../../data/model/home/home_page_data.dart';
import '../widgets/book_card.dart';
import '../widgets/top_pick_clipper.dart';
import 'package:shelf/_core/constants/move.dart';

class TopPicksSection extends StatefulWidget {
  @override
  _TopPicksSectionState createState() => _TopPicksSectionState();
}

class _TopPicksSectionState extends State<TopPicksSection> {
  final ScrollController _scrollController = ScrollController();
  final double _itemExtent = 140.0;
  bool _isAutoScrolling = false;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 100), () {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(_itemExtent * books.length);
        }
      });
    });
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
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

  void _toggleMenu() {
    setState(() {
      _isMenuOpen = !_isMenuOpen;
    });
  }

  void _closeMenu() {
    setState(() {
      _isMenuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_isMenuOpen) {
          _closeMenu();
        }
      },
      child: Stack(
        children: [
          Container(
            height: 460,
            child: Stack(
              children: [
                ClipPath(
                  clipper: TopPicksClipper(),
                  child: Container(
                    height: 350,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [TColor.primaryColor1, TColor.secondaryColor2],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: gap_xxxl),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Our Top Picks',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.menu, color: Colors.white),
                            onPressed: _toggleMenu,
                          ),
                        ],
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
                                double itemOffset = index * _itemExtent;
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
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            right: _isMenuOpen ? 0 : -250,
            top: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              child: Container(
                width: 250,
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    _buildMenuItem(Icons.home, "홈", () {
                      Navigator.pushNamed(context, Move.homePage);
                    }),
                    _buildMenuItem(Icons.fiber_new, "Brand New", () {
                      Navigator.pushNamed(context, Move.brandNewPage);
                    }),
                    _buildMenuItem(Icons.search, "찾기", () {
                      Navigator.pushNamed(context, Move.searchPage);
                    }),
                    _buildMenuItem(Icons.library_books, "내 서재", () {
                      Navigator.pushNamed(context, Move.myShelfPage);
                    }),
                    _buildMenuItem(Icons.person, "내 정보", () {
                      Navigator.pushNamed(context, Move.profileEditPage);
                    }),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: kAccentColor3),
      title: Text(title, style: TextStyle(color: Colors.black)),
      onTap: onTap,
    );
  }
}
