import 'package:uniordle/shared/exports/end_game_exports.dart';

class PerformanceBreakdown extends StatelessWidget {
  final bool won;
  final int attempts;
  final int maxAttempts;
  final double gainedMerit;

  const PerformanceBreakdown({
    super.key,
    required this.won,
    required this.attempts,
    required this.maxAttempts,
    required this.gainedMerit,
  });

  @override
  Widget build(BuildContext context) {
    final double weight = won
        ? (maxAttempts - attempts) / (maxAttempts - 1).toDouble()
        : 0.0;

    String performanceText;
    Color performanceColor;

    if (!won) {
      performanceText = "FAIL";
      performanceColor = AppColors.accent2;
    } else {
      if (weight >= 0.85) {
        performanceText = "HIGH DISTINCTION";
        performanceColor = AppColors.correctColor;
      } else if (weight >= 0.70) {
        performanceText = "DISTINCTION";
        performanceColor = AppColors.accent;
      } else if (weight >= 0.50) {
        performanceText = "CREDIT";
        performanceColor = Colors.orange;
      } else {
        performanceText = "PASS";
        performanceColor = Colors.blueGrey;
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: performanceColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              context.autoText(
                performanceText,
                style: AppFonts.labelSmall.copyWith(
                  color: performanceColor,
                ),
              ),
              context.autoText(
                won ? "$attempts/$maxAttempts ATTEMPTS" : "X/$maxAttempts ATTEMPTS",
                style: AppFonts.labelSmall.copyWith(color: performanceColor),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Builder(
            builder: (context) {
              final double baseSize = AppFonts.labelSmall.fontSize ?? 12;
              final double responsiveSize = context.responsive(baseSize - 2, baseSize);

              final bool isPositive = gainedMerit >= 0;
              final String amount = gainedMerit.toInt().abs().toString();
              final String unit = isPositive ? "merits" : "demerits";
              
              final Color normalColor = isPositive 
                  ? AppColors.onSurfaceVariant 
                  : AppColors.accent2.withValues(alpha: 0.8);
              final Color highlightColor = isPositive 
                  ? AppColors.correctColor
                  : AppColors.accent2;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: context.r(16)),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: AppFonts.labelSmall.copyWith(
                      fontSize: responsiveSize,
                      color: normalColor,
                    ),
                    children: [
                      TextSpan(text: isPositive ? "You earned " : "You gained "),
                      
                      TextSpan(
                        text: amount,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: highlightColor,
                        ),
                      ),
                      
                      const TextSpan(text: " "),
                      
                      TextSpan(
                        text: unit,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: highlightColor,
                        ),
                      ),
                      
                      TextSpan(
                        text: isPositive 
                          ? " based on your number of attempts." 
                          : " due to failing to guess correctly."
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}