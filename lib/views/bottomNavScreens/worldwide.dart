import 'package:flutter/material.dart';

class WorldWide extends StatefulWidget {
  const WorldWide({super.key});

  @override
  State<WorldWide> createState() => _WorldWideState();
}

class _WorldWideState extends State<WorldWide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      body: Text('World'),
    );
  }
}
