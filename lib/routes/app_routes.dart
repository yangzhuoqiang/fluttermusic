import 'package:get/get.dart';

import '../ui/page/discover_moudle/play_list_moudle/play_list_desc/page.dart';
import '../ui/page/login_moudle/code_verify/binding.dart';
import '../ui/page/login_moudle/code_verify/page.dart';
import '../ui/page/discover_moudle/daily_song/binding.dart';
import '../ui/page/discover_moudle/daily_song/page.dart';
import '../ui/page/discover_moudle/play_list_moudle/play_list_detail/binding.dart';
import '../ui/page/discover_moudle/play_list_moudle/play_list_detail/page.dart';
import '../ui/page/discover_moudle/play_list_moudle/subscriber/binding.dart';
import '../ui/page/discover_moudle/play_list_moudle/subscriber/page.dart';
import '../ui/page/discover_moudle/rank/binding.dart';
import '../ui/page/discover_moudle/rank/page.dart';
import '../ui/page/index/binding.dart';
import '../ui/page/index/page.dart';
import '../ui/page/login_moudle/login/binding.dart';
import '../ui/page/login_moudle/login/page.dart';
import '../ui/page/discover_moudle/play_list_moudle/play_list/binding.dart';
import '../ui/page/discover_moudle/play_list_moudle/play_list/page.dart';
import '../ui/page/play/binding.dart';
import '../ui/page/play/play_page.dart';
import '../ui/page/splash/splash_page.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const codeVerify = '/codeVerify';
  static const index = '/index';
  static const playList = '/playList';
  static const playListDetail = '/playListDetail';
  static const subs = '/subs';
  static const dailySongs = '/dailySongs';
  static const rank = '/rank';
  static const play = '/play';
  static const playlistDesc = '/playlistDesc';

  static final routes = <GetPage>[
    GetPage(
      name: splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: codeVerify,
      page: () => const CodeVerifyPage(),
      binding: CodeVerifyBinding(),
    ),
    GetPage(
      name: index,
      page: () => const IndexPage(),
      binding: IndexBinding(),
    ),
    GetPage(
      name: playList,
      page: () => const PlayListPage(),
      binding: PlayListBinding(),
    ),
    GetPage(
      name: playListDetail,
      page: () => const PlayListDetailPage(),
      binding: PlayListDetailBinding(),
    ),
    GetPage(
      name: subs,
      page: () => const SubscriberPage(),
      binding: SubscriberBinding(),
    ),
    GetPage(
      name: dailySongs,
      page: () => const DailySongsPage(),
      binding: DailySongsBinding(),
    ),
    GetPage(
      name: rank,
      page: () => const RankPage(),
      binding: RankBinding(),
    ),
    GetPage(
      name: play,
      page: () => const PlayPage(),
      binding: PlayBinding(),
    ),
    GetPage(
      name: playlistDesc,
      page: () => PlayListDescPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 600),
    ),
  ];
}
