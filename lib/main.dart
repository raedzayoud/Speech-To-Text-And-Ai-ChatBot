import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:speach_to_text/constant.dart';
import 'package:speach_to_text/gemini_chat.dart';

void main() {
  Gemini.init(apiKey: Api_Gemeni_Key);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const GeminiChat(),
    );
  }
}
