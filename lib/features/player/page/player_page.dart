import 'package:arabiamusic_app/core/widgets/arabia_music_app_bar.dart';
import 'package:flutter/material.dart';

class PlayerPage extends StatefulWidget {
  const PlayerPage({super.key});

  @override
  State<PlayerPage> createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: ArabiaMusicAppBar(
          showBackButton: true,
          title: 'Now PLAYING',
        ),
        body: Center(
          child: Text(
            'Player',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      );
}
