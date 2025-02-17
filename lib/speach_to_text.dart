import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SpeachToTexts extends StatefulWidget {
  const SpeachToTexts({super.key});

  @override
  State<SpeachToTexts> createState() => _SpeachToTextState();
}

class _SpeachToTextState extends State<SpeachToTexts> {
  stt.SpeechToText speechToText = stt.SpeechToText();

  bool _speechEnalbled = false;
  String _wordSpoken = "";

  void startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  void onSpeechResult(result) {
    setState(() {
      _wordSpoken = "${result.recognizedWords}";
    });
  }

  void stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void init() async {
    _speechEnalbled = await speechToText.initialize();
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Speech to text",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            speechToText.isNotListening ? Icons.mic_off : Icons.mic,
            color: Colors.white,
          ),
          onPressed: speechToText.isListening ? stopListening : startListening),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                child: Text(
                  speechToText.isListening
                      ? "Listening..."
                      : _speechEnalbled
                          ? "Tap the micophone to start listening"
                          : "Speech not Available",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Result : ",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 18),
                    ),
                    Expanded(
                      child: Text(
                        _wordSpoken,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
