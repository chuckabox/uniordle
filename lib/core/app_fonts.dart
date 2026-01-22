import 'package:uniordle/shared/exports/game_setup_exports.dart';

class AppTextStyles {
  static const String displayFont = 'Lexend';
  static const String uiFont = 'PlusJakartaSans';

  // Big Hero
  static TextStyle get displayLarge => const TextStyle(
        fontFamily: displayFont,
        fontSize: 32,
        fontWeight: FontWeight.w900,
        color: Colors.white,
  );

  static TextStyle get displayMedium => const TextStyle(
        fontFamily: displayFont,
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.white,
    );

  // Titles / Tiles
  static TextStyle get headline => const TextStyle(
        fontFamily: displayFont,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  // UI/ Labels (Buttons, Captions)
  static TextStyle get labelLarge => const TextStyle(
        fontFamily: displayFont,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.white
  );

  static TextStyle get labelMedium => const TextStyle(
        fontFamily: displayFont,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.white70,
  );

  static TextStyle get labelSmall => const TextStyle(
        fontFamily: displayFont,
        fontSize: 10,
        fontWeight: FontWeight.w800,
        color: Colors.blueAccent,
  );
}

class GameSetUpFonts {

  static TextStyle get playGameText => AppTextStyles.labelLarge.copyWith(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.1);

  static TextStyle get wordLengthText => AppTextStyles.displayLarge.copyWith(fontSize: 20, letterSpacing: 1.2);

  static TextStyle get numberOfLettersText => AppTextStyles.displayMedium;

  static TextStyle get lettersText => AppTextStyles.labelMedium;

  static TextStyle get disciplineText => AppTextStyles.displayLarge.copyWith(fontSize: 32);
}

class HomeFonts {
  static TextStyle get disciplineText => AppTextStyles.labelLarge.copyWith(fontSize: 16, fontWeight: FontWeight.w600);

  static TextStyle get titleText => AppTextStyles.displayLarge;

  static TextStyle get mainHeroText => AppTextStyles.displayLarge.copyWith(fontSize: 40, letterSpacing: -1, fontWeight: FontWeight.w900);

  static TextStyle get subHeroText => AppTextStyles.labelMedium.copyWith(fontSize: 14, color: Colors.blueGrey, height: 1.5);

  static TextStyle iconText(Color color) => AppTextStyles.labelSmall.copyWith(letterSpacing: 1.4, color: color);

  static TextStyle tagText(Color color) => AppTextStyles.labelSmall.copyWith(color: color);
}