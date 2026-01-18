import 'dart:developer';
import 'package:flutter_soloud/flutter_soloud.dart';

enum SoundType {
  click,
  keyboard,
  delete,
  enter,
  hover,
}

class SoundManager {
  static final SoundManager _instance = SoundManager._internal();
  factory SoundManager() => _instance;
  SoundManager._internal();

  final Map<SoundType, AudioSource> _sources = {};
  bool _isInitialized = false;

  Future<void> init() async {
    if (_isInitialized) return;

    try {
      await SoLoud.instance.init();
      
      _sources[SoundType.click] = await SoLoud.instance.loadAsset('assets/audio/ui_click.mp3');
      _sources[SoundType.keyboard] = await SoLoud.instance.loadAsset('assets/audio/keyboard_tap.mp3');
      _sources[SoundType.delete] = await SoLoud.instance.loadAsset('assets/audio/delete_tap.mp3');
      _sources[SoundType.enter] = await SoLoud.instance.loadAsset('assets/audio/enter_tap.mp3');
      _sources[SoundType.hover] = await SoLoud.instance.loadAsset('assets/audio/hover.mp3');

      
      
      _isInitialized = true;
    } catch (e) {
      log('Audio Init Error: $e');
    }
  }

  void play(SoundType type) {
    if (!_isInitialized) return;
    
    final source = _sources[type];
    if (source != null) {
      SoLoud.instance.play(source);
    }
  }

  void dispose() {
    SoLoud.instance.deinit();
  }
}