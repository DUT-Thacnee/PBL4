import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _recongnizedText = "";
  bool _isListening = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Recognition'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            IconButton(
              onPressed:
              _speech.isNotListening ? _startListening : _stopListening,// _startListening,
              icon: Icon(_isListening ? Icons.mic : Icons.mic_none),
              iconSize: 100,
              color: _isListening ? Colors.red : Colors.grey,
            ),
            const SizedBox(height: 20),
            Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  _recongnizedText.isNotEmpty
                      ? _recongnizedText
                      : "Result here......",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _recongnizedText.isNotEmpty ? _copyText : null,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Copy",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  onTap: _recongnizedText.isNotEmpty ? _clearText : null,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "Clear",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // no error
    super.initState();
    _initSpeechState();
  }

  void _initSpeechState() async {
    // no error
    bool available = await _speech.initialize();
    if (!mounted) return;
    setState(() {
      _isListening = available;
    });
  }

  void _startListening() {
    // no error
    _speech.listen(onResult: (result) {
      setState(() {
        _recongnizedText = result.recognizedWords;
      });
    });
    setState(() {
      _isListening = true;
    });
  }

void _stopListening() {
    _speech.stop();
    setState(() {});
  }

  void _copyText() {
    // no error
    Clipboard.setData(ClipboardData(text: _recongnizedText));
    _showSnackBar('Text copied');
  }

  void _clearText() {
    // no error
    _speech.stop();
    setState(() {
      _recongnizedText = '';
    });
  }

  void _showSnackBar(String message) {
    // no error
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }
}
