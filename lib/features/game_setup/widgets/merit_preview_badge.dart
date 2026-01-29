import 'package:uniordle/core/app_icons.dart';
import 'package:uniordle/shared/exports/game_exports.dart';

class MeritPreviewBadge extends StatelessWidget {
  final int difficulty;
  final int wordLength;
  final Discipline discipline;

  const MeritPreviewBadge({
    super.key,
    required this.difficulty,
    required this.wordLength,
    required this.discipline,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserStats>(
      valueListenable: statsManager.statsNotifier,
      builder: (context, stats, child) {
        final ranges = UserStatsRewards.getMeritRange(stats, difficulty, wordLength);
        final int bonusPercent = (max(0, stats.unlockedIds.length - 1) * 5);

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: discipline.color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                AppIcons.merits, 
                size: 16, 
                color: discipline.color
              ),
              const SizedBox(width: 8),
              Text(
                "POTENTIAL MERITS: ",
                style: AppFonts.labelLarge.copyWith(
                  color: discipline.color,
                ),
              ),
              
              Text(
                ranges.original,
                style: AppFonts.labelLarge.copyWith(
                  color: bonusPercent > 0 
                      ? discipline.color.withValues(alpha: 0.5) 
                      : discipline.color,
                  fontWeight: bonusPercent > 0 ? FontWeight.normal : FontWeight.bold,
                  decoration: bonusPercent > 0 ? TextDecoration.lineThrough : null,
                ),
              ),

              if (bonusPercent > 0) ...[
                const SizedBox(width: 6),
                Icon(
                  LucideIcons.arrowRight, 
                  size: 14, 
                  color: discipline.color.withValues(alpha: 0.7)
                ),
                const SizedBox(width: 6),
                Text(
                  ranges.boosted,
                  style: AppFonts.labelLarge.copyWith(
                    color: discipline.color,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}