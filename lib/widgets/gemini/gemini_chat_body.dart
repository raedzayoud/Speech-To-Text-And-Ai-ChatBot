import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiChatBody extends StatefulWidget {
  const GeminiChatBody({super.key});

  @override
  State<GeminiChatBody> createState() => _GeminiChatBodyState();
}

class _GeminiChatBodyState extends State<GeminiChatBody> {
  List<ChatMessage> Listmessage = [];
  final Gemini gemini = Gemini.instance;
  ChatUser currentUser = ChatUser(id: "0", firstName: "user");
  ChatUser geminiUser = ChatUser(
      id: "1",
      firstName: "Gemini");
      // profileImage:
      //     "https://upload.wikimedia.org/wikipedia/commons/8/8a/Google_Gemini_logo.svg");
  @override
  Widget build(BuildContext context) {
    return DashChat(
        currentUser: currentUser, onSend: _sendMessage, messages: Listmessage);
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      Listmessage.insert(0, chatMessage);
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastmessage = Listmessage.firstOrNull;
        if (lastmessage != null && lastmessage.user == geminiUser) {
        } else {
          String response = event.content?.parts
                  ?.fold("", (previous, current) => "${previous}${current}") ??
              "";
          ChatMessage message =
              ChatMessage(user: geminiUser, createdAt: DateTime.now(),text: response);
              setState(() {
                Listmessage.insert(0, message);
              });
        }
      });
    } catch (e) {}
  }
}
