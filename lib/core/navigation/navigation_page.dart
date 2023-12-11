import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:arabiamusic_app/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          SearchRoute(),
          PodcastsRoute(),
          SettingsRoute(),
        ],
        bottomNavigationBuilder: (context, tabsRouter) => NavigationBarTheme(
          data: const NavigationBarThemeData(
            indicatorColor: Colors.transparent,
          ),
          child: NavigationBar(
            backgroundColor: AppColors.grey[500],
            height: 60,
            surfaceTintColor: Colors.transparent,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: tabsRouter.setActiveIndex,
            selectedIndex: tabsRouter.activeIndex,
            destinations: <Widget>[
              NavigationDestination(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  child: SvgPicture.asset(
                    'assets/images/home.svg',
                    width: 26,
                  ),
                ),
                selectedIcon: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 26,
                  child: SvgPicture.asset(
                    'assets/images/home.svg',
                    width: 26,
                  ),
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  child: SvgPicture.asset(
                    'assets/images/search.svg',
                    width: 26,
                  ),
                ),
                selectedIcon: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 26,
                  child: SvgPicture.asset(
                    'assets/images/search.svg',
                    width: 26,
                  ),
                ),
                label: 'Search',
              ),
              FittedBox(
                child: SizedBox(
                  width: 45,
                  child: FloatingActionButton(
                    onPressed: () {},
                    tooltip: 'Player',
                    elevation: 0,
                    backgroundColor: AppColors.pink[500],
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.headphones,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              NavigationDestination(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  child: SvgPicture.asset(
                    'assets/images/podcast.svg',
                    width: 26,
                  ),
                ),
                selectedIcon: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 26,
                  child: SvgPicture.asset(
                    'assets/images/podcast.svg',
                    width: 26,
                  ),
                ),
                label: 'Podcasts',
              ),
              NavigationDestination(
                icon: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 20,
                  child: SvgPicture.asset(
                    'assets/images/settings.svg',
                    width: 26,
                  ),
                ),
                selectedIcon: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  width: 26,
                  child: SvgPicture.asset(
                    'assets/images/settings.svg',
                    width: 26,
                  ),
                ),
                label: 'Settings',
              ),
            ],
          ),
        ),
        homeIndex: 0,
      );
}
