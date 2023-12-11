import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:arabiamusic_app/core/routes/router.gr.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) => AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          SearchRoute(),
          PodcastsRoute(),
          SettingsRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) => NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.transparent,
            labelTextStyle: MaterialStateProperty.resolveWith(
              (states) => TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: states.contains(MaterialState.selected)
                    ? AppColors.purple[700]
                    : AppColors.white[600],
              ),
            ),
          ),
          child: DecoratedBox(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: NavigationBar(
              backgroundColor: Colors.white,
              height: 60,
              surfaceTintColor: Colors.white.withOpacity(0),
              labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
              onDestinationSelected: tabsRouter.setActiveIndex,
              selectedIndex: tabsRouter.activeIndex,
              destinations: <Widget>[
                NavigationDestination(
                  icon: Icon(
                    CupertinoIcons.home,
                    color: AppColors.white[600],
                    size: 28,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.home,
                    color: AppColors.white[600],
                    size: 28,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.search,
                    color: AppColors.white[600],
                    size: 28,
                  ),
                  selectedIcon: Icon(
                    Icons.search,
                    color: AppColors.purple[700],
                    size: 28,
                  ),
                  label: 'Search',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.podcasts,
                    color: AppColors.white[600],
                    size: 28,
                  ),
                  selectedIcon: Icon(
                    Icons.podcasts,
                    color: AppColors.purple[700],
                    size: 28,
                  ),
                  label: 'Podcasts',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.settings,
                    color: AppColors.white[600],
                    size: 28,
                  ),
                  selectedIcon: Icon(
                    Icons.settings,
                    color: AppColors.purple[700],
                    size: 28,
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      );
}
