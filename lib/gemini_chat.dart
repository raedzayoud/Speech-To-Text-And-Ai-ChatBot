import 'package:flutter/material.dart';
import 'package:speach_to_text/widgets/gemini/gemini_chat_body.dart';

class GeminiChat extends StatelessWidget {
  const GeminiChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gemini Chat"),
      ),
      body: GeminiChatBody(),

    );
  }
}