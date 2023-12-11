import 'package:arabiamusic_app/core/widgets/arabia_music_app_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        appBar: ArabiaMusicAppBar(
          title: 'ALL SONGS',
        ),
        body: Center(
          child: Text(
            'Home',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      );
}
