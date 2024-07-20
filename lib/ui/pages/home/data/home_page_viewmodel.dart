import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/ui/pages/home/data/home_page_model.dart';

// 창고 관리자
final homePageProvider =
    StateNotifierProvider<HomePageViewmodel, HomePageModel?>((ref) {
  return HomePageViewmodel(ref)..loadHomePageData();
});

// 창고 데이터
class HomePageModel {
  final HomeData homeData;
  final bool isloading;

  const HomePageModel({
    required this.homeData,
    required this.isloading,
  });
}

// 창고
class HomePageViewmodel extends StateNotifier<HomePageModel?> {
  final Ref ref;
  final refreshCtrl = RefreshController();

  HomePageViewmodel(this.ref)
      : super(
          HomePageModel(
            homeData: HomeData(
              bestSellers: [],
              bookHistory: [],
              dayBestSeller: DayBestSellerDTO(
                id: 0,
                // 기본값으로 초기화
                author: '',
                bookImagePath: '',
                bookIntro: '',
                bookTitle: '',
              ),
              weekBestSellers: [],
            ),
            isloading: true,
          ),
        );

  Future<void> loadHomePageData() async {
    state = HomePageModel(homeData: state!.homeData, isloading: true);
    SessionUser sessionUser = ref.read(sessionProvider);

    try {
      HomeData homeData =
          await ref.read(homeRepoProvider).fetchHomeData(sessionUser.jwt!);
      state = HomePageModel(homeData: homeData, isloading: false);
    } catch (e) {
      state = HomePageModel(homeData: state!.homeData, isloading: false);
    }
  }
}
