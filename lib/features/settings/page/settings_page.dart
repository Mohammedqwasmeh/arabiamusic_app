import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
    body: Center(
      child: Text(
        'Settings',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
    ),
  );
}
