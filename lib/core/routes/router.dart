import 'package:arabiamusic_app/core/navigation/navigation_page.dart';
import 'package:arabiamusic_app/features/home/page/home_page.dart';
import 'package:arabiamusic_app/features/player/page/player_page.dart';
import 'package:arabiamusic_app/features/podcasts/page/podcasts_page.dart';
import 'package:arabiamusic_app/features/search/page/search_page.dart';
import 'package:arabiamusic_app/features/settings/page/settings_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CustomRoute(
      path: '/',
      page: NavigationPage,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      children: [
        AutoRoute(
          path: 'Home',
          page: HomePage,
        ),
        AutoRoute(
          path: 'Search',
          page: SearchPage,
        ),
        AutoRoute(
          path: 'Podcasts',
          page: PodcastsPage,
        ),
        AutoRoute(
          path: 'Settings',
          page: SettingsPage,
        ),
      ],
    ),
    CustomRoute(
      path: 'Player',
      page: PlayerPage,
      transitionsBuilder: TransitionsBuilders.slideTop,
    ),
  ],
)
class $AppRouter {}
