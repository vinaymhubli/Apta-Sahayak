import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speaking_app/widget/button.dart';
import 'package:translator/translator.dart';

class SpeakHome extends StatefulWidget {
  SpeakHome({Key? key}) : super(key: key);

  @override
  State<SpeakHome> createState() => _SpeakHomeState();
}

class _SpeakHomeState extends State<SpeakHome> {
  FlutterTts flutterTts = FlutterTts();
  GoogleTranslator translator = GoogleTranslator();
  String inputText = '';
  bool _isloading = false;
  List<String> _translatedTexts = [];
  List<String> _languagescode = [
    'kn',
    'en',
    'te',
    'ta',
    'hi',
    'ml',
    'bn',
    'gu',
    'pa',
  ];
  Future translate() async {
    List<String> translatedTexts = [];
    setState(() {
      _isloading = true;
    });
    for (String code in _languagescode) {
      Translation translation = await translator.translate(inputText, to: code);
      String translatedText = translation.text;
      translatedTexts.add(translatedText);
    }
    setState(() {
      _translatedTexts = translatedTexts;
      _isloading = false;
      print(translatedTexts);
    });
  }

  Future speak(String languageCode, String text) async {
    await flutterTts.setLanguage(languageCode);
    await flutterTts.setPitch(0.5);
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Color.fromARGB(255, 135, 6, 81),
          statusBarBrightness: Brightness.dark
        ),
        backgroundColor: const Color.fromARGB(255, 135, 6, 81),
        title: const Text("Apta🤝Sahayak",
            style: TextStyle(
              fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 234, 231, 22))),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          TextField(
            style: const TextStyle(
                color: const Color.fromARGB(255, 239, 234, 237)),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(25),
                hintText: "Enter Text....",
                hintStyle: const TextStyle(
                    color: const Color.fromARGB(255, 252, 252, 252)),
                border: InputBorder.none,
                filled: true,
                fillColor: const Color.fromARGB(255, 135, 6, 81),
                suffixIcon: _isloading
                    ? const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator(
                            backgroundColor: Colors.white),
                      )
                    : IconButton(
                        onPressed: () {
                          if (inputText.isNotEmpty) translate();
                        },
                        icon: const Icon(
                          Icons.translate_outlined,
                          color: const Color.fromARGB(255, 229, 209, 219),
                        ))),
            onChanged: (input) {
              inputText = input;
            },
          ),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(
                  parent: const AlwaysScrollableScrollPhysics()),
              children: [
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Kannada '
                      : _translatedTexts[0],
                  flag: 'Kannada.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty) {
                      speak('kn-IN', _translatedTexts[0]);
                    }
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'English'
                      : _translatedTexts[1],
                  flag: 'english.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('en-IN', _translatedTexts[1]);
                  },
                ),
                FlagButton(
                  text:
                      _translatedTexts.isEmpty ? 'Telugu' : _translatedTexts[2],
                  flag: 'Telugu.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('te-IN', _translatedTexts[2]);
                  },
                ),
                FlagButton(
                  text:
                      _translatedTexts.isEmpty ? 'Tamil' : _translatedTexts[3],
                  flag: 'tamil.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('ta-IN', _translatedTexts[3]);
                  },
                ),
                FlagButton(
                  text:
                      _translatedTexts.isEmpty ? 'Hindi' : _translatedTexts[4],
                  flag: 'hindi.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('hi-IN', _translatedTexts[4]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Maliyalam'
                      : _translatedTexts[5],
                  flag: 'Mal.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('ml-IN', _translatedTexts[5]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Bengali'
                      : _translatedTexts[6],
                  flag: 'ben.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('bn-IN', _translatedTexts[6]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Gujarati'
                      : _translatedTexts[7],
                  flag: 'gujarati.jpg',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('gu-IN', _translatedTexts[7]);
                  },
                ),
                FlagButton(
                  text: _translatedTexts.isEmpty
                      ? 'Punjabi'
                      : _translatedTexts[8],
                  flag: 'punjabi.png',
                  onTap: () {
                    if (_translatedTexts.isNotEmpty)
                      speak('pa-IN', _translatedTexts[8]);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
