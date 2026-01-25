import 'package:uniordle/features/profile/widgets/profile_level.dart';
import 'package:uniordle/shared/exports/profile_screen_exports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final int solvedCount = int.parse('${currentStats.solved}');
    const int wordsPerLevel = 10;

    final int currentLevel = (solvedCount / wordsPerLevel).floor();
    final double progressValue = (solvedCount % wordsPerLevel) / wordsPerLevel;
    final int nextLevel = currentLevel + 1;

    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ProfileHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(
                child: SummaryCard(
                  label: "Streak", 
                  value: '${currentStats.streak}',
                  icon: Icons.local_fire_department,
                  iconColor: Colors.orange,
                )
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SummaryCard(
                  label: "Solved", 
                  value: '${currentStats.solved}',
                  icon: Icons.check_circle_outline,
                  iconColor: AppColors.accent,
                )
              ),
              const SizedBox(width: 12),
              Expanded(
                child: LevelCard(
                  level: currentLevel,
                  progress: progressValue,
                  nextLevel: nextLevel,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}