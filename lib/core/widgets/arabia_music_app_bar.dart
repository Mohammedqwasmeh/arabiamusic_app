import 'package:arabiamusic_app/core/constant/constants.dart';
import 'package:arabiamusic_app/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArabiaMusicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ArabiaMusicAppBar({
    required this.title,
    this.showBackButton = false,
    super.key,
  });

  final bool showBackButton;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: showBackButton,
        child: Center(
          child: IconButton(
            onPressed: () => context.router.popForced(),
            icon: const Icon(
              CupertinoIcons.chevron_down,
              size: 24,
            ),
          ),
        ),
      ),
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      actions: [
        Center(
          child: IconButton(
            onPressed: () {
              if (ModalRoute.of(context)?.settings.name == 'NavigationRoute') {
                context.tabsRouter.setActiveIndex(1);
              } else {
                context.router.replace(NavigationRoute(activeIndex: 1));
              }
            },
            icon: SvgPicture.asset(
              'assets/images/search.svg',
              width: 16,
              height: 16,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppConstants.appBarHeight);
}
