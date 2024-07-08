import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/store/change_color.dart';
import '../../../../_core/constants/constants.dart';
import '../../../data/store/page_index.dart';
import '../widgets/page_content.dart';

class StartViewPageBody extends ConsumerWidget {
  final Size media;

  const StartViewPageBody({required this.media});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChangeColor = ref.watch(isChangeColorProvider);
    final currentPage = ref.watch(pageIndexProvider);

    return Container(
      width: media.width,
      height: media.height,
      color: Colors.white,
      child: Stack(
        children: [
          PageView(
            controller: PageController(initialPage: currentPage),
            onPageChanged: (int page) {
              ref.read(pageIndexProvider.notifier).setPage(page);
              if (page == 1) {
                ref
                    .read(isChangeColorProvider.notifier)
                    .state = true;
              }
            },
            children: [
              PageContent(
                context,
                title: "Shelf",
                subtitle: "함께 책을 탐험하세요",
                isChangeColor: false,
                showButtons: false,
              ),
              PageContent(
                context,
                title: "Welcome to Shelf",
                subtitle: "모든 책을 하나의 공간에,",
                isChangeColor: isChangeColor,
                showButtons: true,
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  width: currentPage == index ? 12.0 : 8.0,
                  height: currentPage == index ? 12.0 : 8.0,
                  decoration: BoxDecoration(
                    color: currentPage == index ? TColor.primaryColor1 : TColor
                        .grey,
                    shape: BoxShape.circle,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}