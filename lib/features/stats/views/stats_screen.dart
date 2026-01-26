import 'package:uniordle/shared/exports/stats_exports.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<UserStats>(
      valueListenable: statsManager.statsNotifier,
      builder: (context, stats, child) {
        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section
              Center(
                child: Column(
                  children: [
                    Text(
                      "ACADEMIC PERFORMANCE",
                      style: AppFonts.displayMedium.copyWith(letterSpacing: 1.5),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Your learning journey analytics",
                      style: AppFonts.labelSmall.copyWith(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 4-Column Stat Grid
              Row(
                children: [
                  Expanded(child: StatCard(value: "${stats.totalGames}", label: "Total\nGames")),
                  const SizedBox(width: 10),
                  Expanded(child: StatCard(value: stats.winPercentage, label: "Win %", color: Colors.red)),
                  const SizedBox(width: 10),
                  Expanded(child: StatCard(value: "${stats.streak}", label: "Current\nStreak", color: Colors.orange)),
                  const SizedBox(width: 10),
                  Expanded(child: StatCard(value: "${stats.maxStreak}", label: "Max\nStreak", color: AppColors.accent)),
                ],
              ),
              
              const SizedBox(height: 48),

              // Guess Distribution Section
              Text(
                "GUESS DISTRIBUTION",
                style: AppFonts.labelSmall.copyWith(
                  color: Colors.grey,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),
              GuessDistributionChart(distribution: stats.guessDistribution),
              
              const SizedBox(height: 48),
              
              // You can add "Recent Games" or other sections below
            ],
          ),
        );
      },
    );
  }
}