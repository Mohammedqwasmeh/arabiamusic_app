// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../features/home/page/home_page.dart' as _i3;
import '../../features/player/page/player_page.dart' as _i2;
import '../../features/podcasts/page/podcasts_page.dart' as _i5;
import '../../features/search/page/search_page.dart' as _i4;
import '../../features/settings/page/settings_page.dart' as _i6;
import '../navigation/navigation_page.dart' as _i1;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    NavigationRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i1.NavigationPage(),
        transitionsBuilder: _i7.TransitionsBuilders.fadeIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    PlayerRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i2.PlayerPage(),
        transitionsBuilder: _i7.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    SearchRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SearchPage(),
      );
    },
    PodcastsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.PodcastsPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.SettingsPage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          NavigationRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              HomeRoute.name,
              path: 'Home',
              parent: NavigationRoute.name,
            ),
            _i7.RouteConfig(
              SearchRoute.name,
              path: 'Search',
              parent: NavigationRoute.name,
            ),
            _i7.RouteConfig(
              PodcastsRoute.name,
              path: 'Podcasts',
              parent: NavigationRoute.name,
            ),
            _i7.RouteConfig(
              SettingsRoute.name,
              path: 'Settings',
              parent: NavigationRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          PlayerRoute.name,
          path: 'Player',
        ),
      ];
}

/// generated route for
/// [_i1.NavigationPage]
class NavigationRoute extends _i7.PageRouteInfo<void> {
  const NavigationRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NavigationRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'NavigationRoute';
}

/// generated route for
/// [_i2.PlayerPage]
class PlayerRoute extends _i7.PageRouteInfo<void> {
  const PlayerRoute()
      : super(
          PlayerRoute.name,
          path: 'Player',
        );

  static const String name = 'PlayerRoute';
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'Home',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i4.SearchPage]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: 'Search',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i5.PodcastsPage]
class PodcastsRoute extends _i7.PageRouteInfo<void> {
  const PodcastsRoute()
      : super(
          PodcastsRoute.name,
          path: 'Podcasts',
        );

  static const String name = 'PodcastsRoute';
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'Settings',
        );

  static const String name = 'SettingsRoute';
}
