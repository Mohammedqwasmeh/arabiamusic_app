import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PodcastsPage extends StatefulWidget {
  const PodcastsPage({super.key});

  @override
  State<PodcastsPage> createState() => _PodcastsPageState();
}

class _PodcastsPageState extends State<PodcastsPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Text(
        'Podcasts',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
