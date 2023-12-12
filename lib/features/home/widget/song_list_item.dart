import 'package:arabiamusic_app/core/constant/colors.dart';
import 'package:arabiamusic_app/core/data/config.dart';
import 'package:arabiamusic_app/core/util/date/date_utils.dart';
import 'package:arabiamusic_app/features/home/model/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SongListItem extends StatelessWidget {
  const SongListItem({
    required this.song,
    required this.changeNowPlaying,
    this.isHistory = false,
    super.key,
  });

  final Song song;
  final bool isHistory;
  final void Function(Song) changeNowPlaying;

  @override
  Widget build(BuildContext context) {
    final isPlaying =
        Config().nowPlaying != null && Config().nowPlaying?.id == song.id;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () => changeNowPlaying(song),
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(11),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 8,
          ),
          decoration: isPlaying
              ? BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(11),
                  ),
                )
              : null,
          child: Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: AbsorbPointer(
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor:
                          isPlaying ? AppColors.pink[500] : Colors.white,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      padding: EdgeInsetsDirectional.zero,
                    ),
                    child: SvgPicture.asset(
                      isPlaying
                          ? 'assets/images/pause.svg'
                          : 'assets/images/play.svg',
                      width: 11,
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              song.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              song.genre,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Text(
                      DateUtil.formatDuration(song.length),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
