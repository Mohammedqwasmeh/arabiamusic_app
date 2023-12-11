import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Text(
        'Search',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  );
}
