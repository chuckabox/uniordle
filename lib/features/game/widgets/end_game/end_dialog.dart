import 'package:uniordle/features/game/widgets/end_game/attempts_info.dart';
import 'package:uniordle/features/game/widgets/end_game/end_dialog_header.dart';
import 'package:uniordle/features/game/widgets/end_game/solution_box.dart';
import 'package:uniordle/features/game/widgets/game_info_bar.dart';
import 'package:uniordle/features/home/models/discipline.dart';
import 'package:uniordle/features/profile/controller/stats_manager.dart';
import 'package:uniordle/features/profile/widgets/level_card.dart';
import 'package:uniordle/shared/buttons/primary_button.dart';
import 'package:uniordle/shared/exports/game_exports.dart';
import 'package:uniordle/shared/layout/base_dialog.dart';
import 'package:uniordle/features/profile/models/user_stats.dart';

class EndDialog extends StatefulWidget {
  final bool won;
  final String solution;
  final int attempts;
  final int maxAttempts;
  final String yearLevel;
  final Discipline discipline;
  final VoidCallback onRestart;

  const EndDialog({
    super.key,
    required this.won,
    required this.solution,
    required this.attempts,
    required this.maxAttempts,
    required this.yearLevel,
    required this.discipline,
    required this.onRestart,
  });

  @override
  State<EndDialog> createState() => _EndDialogState();
}

class _EndDialogState extends State<EndDialog> with SingleTickerProviderStateMixin {
  
  late AnimationController _controller;
  late Animation<double> _totalProgressAnimation;

  late double startTotalValue;
  late double endTotalValue;
  late int nextLevelGoal;
  
  late double startProgress;
  late double endProgress;
  late int currentLevel;
  late int nextLevel;
  late String progressLabel;

  @override
  void initState() {
    super.initState();
    
    final stats = statsManager.statsNotifier.value;
    final int levelValue = _mapYearToValue(widget.yearLevel);
    final gainedXP = UserStatsExtension.calculateGainedXP(levelValue, widget.solution.length);

    // 1. Calculate Cumulative Values
    // If stats.currentLevel is 5 and progress is 0.8, startTotalValue is 5.8
    startTotalValue = stats.currentLevel + stats.levelProgress;
    
    // Calculate how much 1 XP is worth in "Level Units" 
    // (e.g., if 100 XP = 1 Level, then gainedXP / 100)
    double levelGain = gainedXP / 100; 
    endTotalValue = startTotalValue + levelGain;
    
    nextLevelGoal = stats.nextLevel;

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (1500 + (levelGain * 500)).toInt()), // Longer if leveling up multiple times
    );

    _totalProgressAnimation = Tween<double>(
      begin: startTotalValue,
      end: endTotalValue,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOutCubic));

    Future.delayed(const Duration(milliseconds: 600), () {
      if (mounted) _controller.forward();
    });
  }
  
  @override
  Widget build(BuildContext context) {
    final int levelValue = _mapYearToValue(widget.yearLevel);
    final gainedCredits = UserStatsExtension.calculateGainedXP(levelValue, widget.solution.length);

    return BaseDialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16, 
          horizontal: 12
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            EndDialogHeader(won: widget.won),
            const SizedBox(height: 12),
            if (widget.won) ...[
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
                ),
                child: Text(
                  '+$gainedCredits MERITS',
                  style: AppFonts.labelMedium.copyWith(
                    color: AppColors.accent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              AnimatedBuilder(
            animation: _totalProgressAnimation,
            builder: (context, child) {
              final double currentTotal = _totalProgressAnimation.value;
              
              final int displayLevel = currentTotal.floor();
              final double displayProgress = currentTotal % 1.0;
              
              return LevelCard(
                level: displayLevel,
                progress: displayProgress,
                nextLevel: displayLevel + 1,
                progressLabel: "LEVELING UP...", 
              );
            },
          ),
            ],


            const SizedBox(height: 12),
            SolutionBox(solution: widget.solution),
            const SizedBox(height: 12),
            AttemptsInfo(attempts: widget.attempts, maxAttempts: widget.maxAttempts, won: widget.won),
            const SizedBox(height: 12),
            GameInfoBar(disciplineName: widget.discipline.name, yearLevel: widget.yearLevel, wordLength: widget.solution.length),
            const SizedBox(height: 24),
            PrimaryButton(
              label: 'NEW GAME',
              color: AppColors.accent,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  '/setup',
                  arguments: widget.discipline
                );
              },
              borderRadius: 24,
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'HOME',
              borderRadius: 24,
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/',
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

int _mapYearToValue(String year) {
  if (year.contains('1st')) return 1;
  if (year.contains('2nd')) return 2;
  if (year.contains('3rd')) return 3;
  return 4; // Postgrad
}