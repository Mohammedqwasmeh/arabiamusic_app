import 'package:arabiamusic_app/core/routes/router.gr.dart';
import 'package:arabiamusic_app/core/util/theme/theme.dart';
import 'package:flutter/material.dart';

class ArabiaMusicApp extends StatelessWidget {
  ArabiaMusicApp({
    super.key,
  });

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: _appRouter.delegate(
        initialRoutes: [
          const NavigationRoute(),
        ],
      ),
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
