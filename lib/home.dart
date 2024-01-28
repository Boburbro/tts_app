import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  Home({super.key});

  final FlutterTts flutterTts = FlutterTts();
  TextEditingController tts = TextEditingController();

  speek(String text) async {
    if (text.isEmpty) {
      return;
    }
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TTS"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: tts,
                decoration: const InputDecoration(
                  label: Text("Enter the text"),
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                ),
                maxLines: 6,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () => speek(tts.text), child: const Text("Speech"))
            ],
          ),
        ),
      ),
    );
  }
}
