import 'package:flutter/material.dart';
import 'package:speach_to_text/speach_to_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SpeachToTexts(),
    );
  }
}
