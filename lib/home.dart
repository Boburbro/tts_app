import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:tts/servise.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BannerAd? _banner;

  final FlutterTts flutterTts = FlutterTts();

  TextEditingController tts = TextEditingController();

  @override
  void initState() {
    super.initState();
    _createBanner();
  }

  void _createBanner() {
    _banner = BannerAd(
      size: AdSize.fullBanner,
      adUnitId: MobileAdsManager.unitBanner,
      listener: MobileAdsManager.adsListener,
      request: const AdRequest(),
    )..load();
  }

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
      bottomNavigationBar: _banner == null
          ? Container()
          : Container(
              margin: const EdgeInsets.only(bottom: 12),
              height: 52,
              child: AdWidget(ad: _banner!),
            ),
    );
  }
}
