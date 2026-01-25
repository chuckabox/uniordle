import 'package:uniordle/shared/exports/profile_screen_exports.dart';

class LevelCard extends StatelessWidget {
  final int level;
  final double progress; // Value between 0.0 and 1.0
  final int nextLevel;

  const LevelCard({
    super.key,
    required this.level,
    required this.progress,
    required this.nextLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            "LEVEL",
            style: AppTextStyles.labelMedium,
          ),
          const SizedBox(height: 4),
          Text(
            "$level",
            style: AppTextStyles.displayMedium,
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: AppColors.surfaceVariant,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.accent),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "${(progress * 100).toInt()}% TO $nextLevel",
            style: AppTextStyles.labelSmall
          ),
        ],
      ),
    );
  }
}