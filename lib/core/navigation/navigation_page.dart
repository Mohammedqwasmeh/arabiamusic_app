import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:arabiamusic_app/core/data/config.dart';
import 'package:arabiamusic_app/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({super.key, this.activeIndex});

  int? activeIndex;

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
        bottomNavigationBuilder: (context, tabsRouter) {
          if (widget.activeIndex != null) {
            Future.delayed(const Duration(milliseconds: 500), () {
              context.tabsRouter.setActiveIndex(widget.activeIndex!);
              widget.activeIndex = null;
            });
          }
          return NavigationBarTheme(
            data: const NavigationBarThemeData(
              indicatorColor: Colors.transparent,
            ),
            child: NavigationBar(
              backgroundColor: AppColors.grey[500],
              height: 64,
              surfaceTintColor: Colors.transparent,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              onDestinationSelected: tabsRouter.setActiveIndex,
              selectedIndex: tabsRouter.activeIndex,
              animationDuration: const Duration(milliseconds: 500),
              destinations: <Widget>[
                NavigationDestination(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/images/home.svg',
                          width: 26,
                        ),
                      ),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: tabsRouter.activeIndex == 0 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 4,
                          width: 16,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.pink[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 26,
                        child: SvgPicture.asset(
                          'assets/images/home.svg',
                          width: 26,
                        ),
                      ),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: tabsRouter.activeIndex == 0 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 4,
                          width: 16,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.pink[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/images/search.svg',
                          width: 26,
                        ),
                      ),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: tabsRouter.activeIndex == 1 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 4,
                          width: 16,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.pink[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 26,
                        child: SvgPicture.asset(
                          'assets/images/search.svg',
                          width: 26,
                        ),
                      ),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: tabsRouter.activeIndex == 1 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 4,
                          width: 16,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.pink[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  label: 'Search',
                ),
                FittedBox(
                  child: SizedBox(
                    width: 45,
                    child: FloatingActionButton(
                      onPressed: () {
                        if (Config().nowPlaying != null) {
                          context.router.push(const PlayerRoute());
                        }
                      },
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
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 22,
                        child: SvgPicture.asset(
                          'assets/images/podcast.svg',
                          width: 26,
                        ),
                      ),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: tabsRouter.activeIndex == 3 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 4,
                          width: 16,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.pink[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 26,
                        child: SvgPicture.asset(
                          'assets/images/podcast.svg',
                          width: 26,
                        ),
                      ),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: tabsRouter.activeIndex == 3 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 4,
                          width: 16,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.pink[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  label: 'Podcasts',
                ),
                NavigationDestination(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/images/settings.svg',
                          width: 25,
                        ),
                      ),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: tabsRouter.activeIndex == 4 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 4,
                          width: 16,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.pink[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  selectedIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      const Spacer(),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: 25,
                        child: SvgPicture.asset(
                          'assets/images/settings.svg',
                          width: 25,
                        ),
                      ),
                      const Spacer(),
                      AnimatedOpacity(
                        opacity: tabsRouter.activeIndex == 4 ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 4,
                          width: 16,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppColors.pink[500],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          );
        },
        homeIndex: 0,
      );
}
