import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';

class GeminiChatBody extends StatefulWidget {
  const GeminiChatBody({super.key});

  @override
  State<GeminiChatBody> createState() => _GeminiChatBodyState();
}

class _GeminiChatBodyState extends State<GeminiChatBody> {
  List<ChatMessage> message = [];
  @override
  Widget build(BuildContext context) {
    ChatUser currentUser = ChatUser(id: "0", firstName: "user");
    ChatUser geminiUser = ChatUser(
        id: "1",
        firstName: "Gemini",
        profileImage:
            "https://upload.wikimedia.org/wikipedia/commons/8/8a/Google_Gemini_logo.svg");
    return DashChat(
        currentUser: currentUser, onSend: _sendMessage, messages: message);
  }

  void _sendMessage(ChatMessage chatMessage) {}
}
