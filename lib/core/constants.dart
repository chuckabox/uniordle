import 'package:flutter/material.dart';

class AppColors {
  static const Color mainBackground = Color(0xFF0A0E17);

  static const Color selectedIcon = Colors.blue;
  static const Color nonSelectedIcon = Colors.grey;
}

class GameConstants {
  static const Color correctColor = Color(0xFF538D4E);
  static const Color inWordColor = Color(0XFFDAC316);
  static const Color notInWordColor = Color(0xFF3A3A3C);
}

class GameHeaderConstants {
  static const double iconEdgePadding = 8;
  static const double preferredSizeHeight = 64;
  static const double borderSideWidth = 1;
  static const double borderSideAlpha = 0.1;
  static const double titleFontSize = 24;
}

class GameScreenConstants {
  static const double boardVerticalPadding = 24;
  static const double keyboardBottomPadding = 24;
}

class KeyBoardConstants {
  static const Color keyBackground = Color(0xFF707070);
  static const double keyHeight = 64;
  static const double keyWidth = 44;
  static const double keyRounding = 4;
  static const double gapPadding = 3;
  static const double specialKeyWidth = 70;
  static const double textOffset = 0;

  static const Duration pressSpeed = Duration(milliseconds: 80);
  static const Duration tapSpeed = Duration(milliseconds: 80);
  static const int darkenSpeed = 10; // ms
  static const double darkenIntensity = 0.2;
}

class BoardTileConstants {
  static const Color tileBackground = Color(0xFF303436);
  static const double fontSize = 36;
  static const double tileSize = 64;
  static const double gapPadding = 3;
  static const double cornerRounding = 5;
  static const double borderWidth = 2;

  static const Duration pumpDuration = Duration(milliseconds: 80);
  static const double pumpBeginScale = 1.0;
  static const double pumpEndScale = 1.05;

  static const int flipSpeed = 600;
}