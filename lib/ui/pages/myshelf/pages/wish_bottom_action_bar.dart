import 'package:cosmos_epub/cosmos_epub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/constants.dart';
import 'package:shelf/ui/pages/home/pages/book_detail_page/data/book_detail_viewmodel.dart';
import 'package:shelf/ui/pages/myshelf/data/myshelf_viewmodel.dart';

class WishBottomActionBar extends ConsumerWidget {
  final int id;

  const WishBottomActionBar({
    required this.id,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookDetailState = ref.watch(bookDetailProvider(id));
    final bookDetailNotifier = ref.watch(bookDetailProvider(id).notifier);
    final myShelfNotifier = ref.read(myShelfDataProvider.notifier);

    if (bookDetailState == null) {
      return Center(child: CircularProgressIndicator());
    }

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
              // 서재 추가 버튼
              onPressed: () async {
                await bookDetailNotifier.updateMyShelfWishList(id);
                final updatedBookDetailState =
                    ref.watch(bookDetailProvider(id));

                if (updatedBookDetailState == null) {
                  return;
                }

                // myShelfNotifier.toggleWishBook(
                //   IsWish(
                //     userId: updatedBookDetailState.bookDetailDTO.userId,
                //     bookId: id,
                //     isWish: updatedBookDetailState.bookDetailDTO.isWish,
                //     createdAt: updatedBookDetailState.bookDetailDTO.createdAt
                //         .toString(),
                //     updatedAt: updatedBookDetailState.bookDetailDTO.updatedAt
                //             ?.toString() ??
                //         '',
                //   ),
                // );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Center(child: Text('알림')),
                      content: Text(
                        updatedBookDetailState.bookDetailDTO.isWish
                            ? '내 서재에 추가되었습니다.'
                            : '내 서재에서 제거되었습니다.',
                        style: TextStyle(
                          color: TColor.secondaryColor1,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        Center(
                          child: TextButton(
                            child: Text('확인'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        )
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: kAccentColor1,
                backgroundColor: Colors.white,
                side: BorderSide(color: kAccentColor1, width: 1),
                minimumSize: Size(double.infinity, 50),
              ),
              icon: bookDetailState.bookDetailDTO.isWish
                  ? Icon(Icons.check_circle_rounded, color: kAccentColor1)
                  : Icon(Icons.add_circle_outline, color: kAccentColor1),
              label: Text(
                '내 서재',
                style: TextStyle(color: kAccentColor1),
              ),
            ),
          ),
          SizedBox(width: 10),
          Flexible(
            flex: 2,
            child: ElevatedButton(
              onPressed: () async {
                // 바로 읽기 버튼 클릭 시 ePub 리더 실행
                await CosmosEpub.openAssetBook(
                    assetPath: 'assets/epub/test01.epub',
                    context: context,
                    bookId: '3',
                    onPageFlip: (int currentPage, int totalPages) {
                      print(currentPage);
                    },
                    onLastPage: (int lastPageIndex) {
                      print('We arrived to the last widget');
                    });
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
