import 'package:uniordle/shared/exports/game_exports.dart';

class AcademicHistory extends StatelessWidget {
  final UserStats stats;

  const AcademicHistory({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    // Show only the 3 most recent games (latest first)
    final recentGames = stats.gameHistory.reversed.take(3).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Academic Record", style: AppFonts.headline),
            if (stats.gameHistory.length > 3)
              TextButton(
                onPressed: () {
                  // TODO: Implement navigation to full history screen
                },
                child: Text(
                  "VIEW ALL",
                  style: AppFonts.labelSmall.copyWith(color: AppColors.accent),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        if (recentGames.isEmpty)
          _buildEmptyHistory()
        else
          ...recentGames.map((game) => _HistoryItemCard(game: game)),
      ],
    );
  }

  Widget _buildEmptyHistory() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.onSurface.withValues(alpha: 0.05)),
      ),
      child: Column(
        children: [
          Icon(LucideIcons.scrollText, color: AppColors.onSurfaceVariant, size: 32),
          const SizedBox(height: 8),
          Text(
            "No academic records found.\nComplete a game to start your transcript.",
            textAlign: TextAlign.center,
            style: AppFonts.labelMedium.copyWith(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}

class _HistoryItemCard extends StatelessWidget {
  final Map<String, dynamic> game;

  const _HistoryItemCard({required this.game});

  @override
  Widget build(BuildContext context) {
    final bool won = game['won'] ?? true;
    final int attempts = game['attempts'] ?? 0;
    final int maxAttempts = game['maxAttempts'] ?? 8;
    final int merit = game['merit'] ?? 0;
    final String word = game['word'] ?? "?????";

    // Your PerformanceBreakdown logic
    final double weight = won ? (maxAttempts - attempts) / (maxAttempts - 1).toDouble() : 0.0;
    
    String gradeText;
    Color gradeColor;

    if (!won) {
      gradeText = "FAIL";
      gradeColor = AppColors.accent2;
    } else if (weight >= 0.85) {
      gradeText = "HIGH DISTINCTION";
      gradeColor = AppColors.correctColor;
    } else if (weight >= 0.70) {
      gradeText = "DISTINCTION";
      gradeColor = AppColors.accent;
    } else if (weight >= 0.50) {
      gradeText = "CREDIT";
      gradeColor = Colors.orange;
    } else {
      gradeText = "PASS";
      gradeColor = Colors.blueGrey;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: gradeColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: gradeColor.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  word.toUpperCase(), 
                  style: AppFonts.labelLarge.copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2)
                ),
                Text(
                  "$attempts/$maxAttempts ATTEMPTS", 
                  style: AppFonts.labelSmall.copyWith(color: AppColors.onSurfaceVariant)
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                gradeText, 
                style: AppFonts.labelSmall.copyWith(color: gradeColor, fontWeight: FontWeight.bold)
              ),
              Text(
                won ? "+$merit MERITS" : "$merit MERITS",
                style: AppFonts.labelSmall.copyWith(
                  color: won ? AppColors.correctColor : AppColors.accent2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}