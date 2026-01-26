import 'package:uniordle/shared/exports/settings_exports.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      fontFamily: AppTextStyles.displayFont,
      scaffoldBackgroundColor: AppColors.surface,
    ).copyWith(
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayMedium,
        headlineMedium: AppTextStyles.displayLarge,
        labelLarge: AppTextStyles.labelLarge,
        labelSmall: AppTextStyles.labelMedium,
      )
    );
  }
}