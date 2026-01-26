import 'package:uniordle/shared/exports/stats_exports.dart';

class GuessDistributionChart extends StatelessWidget {
  final Map<int, int> distribution;
  const GuessDistributionChart({super.key, required this.distribution});

  @override
  Widget build(BuildContext context) {
    int maxCount = distribution.values.fold(0, (max, e) => e > max ? e : max);
    if (maxCount == 0) maxCount = 1; // Prevent division by zero

    return Column(
      children: List.generate(8, (index) {
        int guessNumber = index + 1;
        int count = distribution[guessNumber] ?? 0;
        double widthFactor = count / maxCount;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              SizedBox(
                width: 12,
                child: Text(
                  "$guessNumber",
                  style: AppFonts.labelSmall.copyWith(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Container(
                          height: 22,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.05),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        // Animated Bar
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 800),
                          curve: Curves.easeOutCubic,
                          height: 24,
                          width: count == 0 ? 0 : (constraints.maxWidth * widthFactor).clamp(30.0, constraints.maxWidth),
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 12),
                          decoration: BoxDecoration(
                            color: count > 0 ? AppColors.accent : Colors.grey.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "$count",
                            style: AppFonts.labelSmall.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}