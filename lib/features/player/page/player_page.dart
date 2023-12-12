import 'dart:ui';

import 'package:arabiamusic_app/core/data/config.dart';
import 'package:arabiamusic_app/core/widgets/arabia_music_app_bar.dart';
import 'package:arabiamusic_app/features/home/model/song.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  final Song nowPlaying = Config().nowPlaying!;
  bool isImageLoaded = false;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const ArabiaMusicAppBar(
        showBackButton: true,
        title: 'NOW PLAYING',
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.network(
            nowPlaying.image,
            fit: BoxFit.cover,
            height: screenSize.height,
            width: screenSize.width,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 24,
              sigmaY: 24,
            ),
            child: Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.75),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Expanded(flex: 4, child: buildAvatarImage(screenSize)),
                      Expanded(flex: 2, child: buildInteractions()),
                      Expanded(flex: 2, child: buildSongDetails()),
                      Expanded(flex: 4, child: buildSongController()),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox buildAvatarImage(Size screenSize) {
    return SizedBox(
      width: screenSize.width * 0.5,
      height: screenSize.width * 0.5,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          nowPlaying.image,
        ),
      ),
    );
  }

  Column buildSongController() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            const Text(
              '0:00',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Slider(
                value: 0.4,
                secondaryTrackValue: 0.6,
                onChanged: (double value) {},
                inactiveColor: Colors.white.withOpacity(0.3),
                thumbColor: Colors.white,
              ),
            ),
            const Text(
              '3:40',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 13,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/backward.svg',
                height: 22,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/rewind.svg',
                height: 22,
              ),
            ),
            Container(
              width: 72,
              height: 72,
              margin: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: Colors.black,
                  size: 40,
                ),
                style: IconButton.styleFrom(backgroundColor: Colors.white),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/fastforward.svg',
                height: 22,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/images/forward.svg',
                height: 22,
              ),
            ),
          ],
        )
      ],
    );
  }

  Column buildSongDetails() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          nowPlaying.name,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          nowPlaying.genre,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 13,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Padding buildInteractions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.heart,
                    color: Colors.white,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        'FOLLOW',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
              child: FilledButton(
            onPressed: () {},
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  CupertinoIcons.shuffle,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'SHUFFLE PLAY',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 11,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
