// import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VoiceService {
  static final VoiceService _instance = VoiceService._internal();
  // final FlutterTts _flutterTts = FlutterTts();

  factory VoiceService() {
    return _instance;
  }

  VoiceService._internal();

  Future<void> speak(String text) async {
    // Stub: TTS functionality removed
  }

  Future<void> stop() async {
    // Stub: TTS functionality removed
  }

  Future<List<String>> getAvailableLanguages() async {
    // Stub: TTS functionality removed
    return ['en-US'];
  }

  Future<void> savePreferredLanguage(String languageCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('preferred_language', languageCode);
  }

  Future<String> getPreferredLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('preferred_language') ?? 'en-US';
  }
} 