import 'package:flutter/material.dart';
import 'package:uniordle/features/settings/models/settings_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

final settingsNotifier = ValueNotifier<SettingsState>(SettingsState());