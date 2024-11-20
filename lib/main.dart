import 'package:drag_and_drop/screens/animation_align.dart';
import 'package:drag_and_drop/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      home: AnimationAlignTask(),
    );
  }
}

