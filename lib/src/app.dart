import 'package:flutter/material.dart';

class MonoApp extends StatelessWidget {
  const MonoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
