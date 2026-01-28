import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uniordle/features/settings/settings_manager.dart';
import 'package:uniordle/shared/exports/settings_exports.dart';


class SettingsController {
  ValueListenable<SettingsState> get state => settingsNotifier;

  Future<void> toggleSounds(bool value) async {
    settingsNotifier.value = settingsNotifier.value.copyWith(soundsEnabled: value);
    
    SoundManager().soundsEnabled = value;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sounds_enabled', value);
  }
}