import 'dart:ui';

import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:arabiamusic_app/core/data/config.dart';
import 'package:arabiamusic_app/core/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final song = Config().nowPlaying!;
    bool isImageLoaded = false;

    return GestureDetector(
      onTap: () => context.router.push(const PlayerRoute()),
      child: SizedBox(
        height: 82,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 20,
                width: screenWidth * 0.45,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: AppColors.pink[500],
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 80,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 24, sigmaY: 24),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: SizedBox(
                                height: 56,
                                width: 56,
                                child: Image.network(
                                  song.image,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Shimmer.fromColors(
                                      baseColor:
                                          AppColors.grey[700]!.withOpacity(0.3),
                                      highlightColor: AppColors.pink[500]!,
                                      period: const Duration(milliseconds: 800),
                                      child: Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  frameBuilder: (context, child, frame,
                                      wasSynchronouslyLoaded) {
                                    isImageLoaded = frame != null;
                                    return child;
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (isImageLoaded &&
                                        loadingProgress == null) return child;
                                    return Shimmer.fromColors(
                                      baseColor:
                                          AppColors.grey[700]!.withOpacity(0.3),
                                      highlightColor: AppColors.pink[500]!,
                                      period: const Duration(milliseconds: 800),
                                      child: Container(
                                        height: 56,
                                        width: 56,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(4),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Text(
                                        song.name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/images/pause.svg',
                                          height: 22,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          'assets/images/next.svg',
                                          height: 22,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
