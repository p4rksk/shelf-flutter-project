import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shelf/_core/constants/http.dart';
import 'package:shelf/data/store/session_store.dart';
import 'package:shelf/main.dart';
import 'package:shelf/ui/pages/home/data/home_page_model.dart';
import 'package:shelf/ui/pages/home/data/home_page_repo.dart';

// 창고 관리자
final homePageProvider =
    StateNotifierProvider<HomePageViewmodel, HomePageModel?>((ref) {
  return HomePageViewmodel(ref, null)..initialize();
});

// 창고 데이터
class HomePageModel {
  final HomeData homeData;

  const HomePageModel({
    required this.homeData,
  });
}

// 창고
class HomePageViewmodel extends StateNotifier<HomePageModel?> {
  final mContext = navigatorKey.currentContext;
  final Ref ref;

  HomePageViewmodel(this.ref, super.state);

  void initialize() {
    logger.d("👉👉👉👉 initialize");

    ref.listen<SessionUser>(sessionProvider, (previous, next) {
      logger.d("👉👉👉👉 ref.listen called");
      if (previous?.jwt != next.jwt && next.jwt != null) {
        logger.d("👉👉👉👉 JWT changed, loading home page data");
        loadHomePageData(next.jwt!);
      }
    });

    final sessionUser = ref.watch(sessionProvider);
    logger.d(sessionUser.jwt);

    if (sessionUser.jwt != null) {
      logger.d("👉👉👉👉 Initial JWT present, loading home page data");
      loadHomePageData(sessionUser.jwt!);
    }
  }

  Future<void> loadHomePageData(String jwt) async {
    try {
      logger.d("👉👉👉👉 Loading home page data with JWT: $jwt");
      HomeData homeData = await HomeRepo().fetchHomeData(jwt);
      logger.d("👉👉👉👉 Home data loaded: ${homeData.toString()}");

      state = HomePageModel(homeData: homeData);
    } catch (e) {
      logger.e("Failed to load home data: $e");
    }
  }
}
