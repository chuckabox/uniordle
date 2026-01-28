import 'package:uniordle/features/home/data/disciplines_data.dart';
import 'package:uniordle/shared/buttons/wiggle_button_wrapper.dart';
import 'package:uniordle/shared/exports/game_exports.dart';
import 'package:uniordle/shared/exports/help_exports.dart';
import 'package:uniordle/shared/layout/base_show_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _onDisciplineTap(BuildContext context, Discipline sub, UserStats stats) {
    if (stats.unlockedIds.contains(sub.id)) {
      Navigator.of(context).pushNamed('/setup', arguments: sub);
      return;
    }

    _showUnlockDialog(
      context, 
      sub, 
      credits: stats.availableCredits, 
      nextLevel: stats.nextCreditAtLevel
    );
  }

  void _showUnlockDialog(BuildContext context, Discipline sub, {
    required int credits, 
    required int nextLevel
  }) {
    final bool canAfford = credits > 0;
    final Color buttonColor = canAfford ? sub.color : AppColors.onSurfaceVariant.withValues(alpha: 0.3);
    final Color statusColor = canAfford ? sub.color : AppColors.onSurfaceVariant;
    
    final wiggleKey = GlobalKey<WiggleButtonWrapperState>();

    baseShowDialog(
      context: context,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DisciplineIcon(
            iconName: canAfford ? sub.icon : 'lock',
            color: statusColor,
            size: AppLayout.dialogIcon,
          ),
          const SizedBox(height: 16),
          
          // Title
          Text(
            canAfford ? "Enroll in ${sub.name}?" : "LOCKED",
            style: AppFonts.displayMedium,
          ),
          const SizedBox(height: 12),
          
          // Content
          Text(
            canAfford 
              ? "Would you like to spend 1 Credit to unlock ${sub.name}?"
              : "You don't have enough Credits to unlock ${sub.name} right now.",
            textAlign: TextAlign.center,
            style: AppFonts.labelLarge,
          ),
          
          const SizedBox(height: 12),
          
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$credits ${credits == 1 ? 'Credit' : 'Credits'} Available",
                    style: AppFonts.labelMedium.copyWith(color: statusColor, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (!canAfford) ...[
                Text(
                  "Next Credit at Level $nextLevel",
                  style: AppFonts.labelSmall.copyWith(color: AppColors.onSurfaceVariant),
                ),
              ],
            ],
          ),
          
          const SizedBox(height: 12),
          
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  onPressed: () => Navigator.pop(context),
                  label: "BACK",
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: WiggleButtonWrapper(
                  key: wiggleKey, 
                  child: PrimaryButton(
                    label: "UNLOCK",
                    color: buttonColor,
                    onPressed: () async {
                      if (canAfford) {
                        await statsManager.unlockDiscipline(sub.id);
                        if (context.mounted) Navigator.pop(context);
                      } else {
                        wiggleKey.currentState?.wiggle();
                        
                        SoundManager().play(SoundType.grid); 
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: statsManager.statsNotifier,
      builder: (context, stats, _) {
        return Padding(
          padding: const EdgeInsets.all(AppLayout.sidePadding),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                HomeHero(stats: stats),
                const SizedBox(height: 20),
                DisciplineGrid(
                    disciplines: DisciplinesData.all,
                    unlockedIds: stats.unlockedIds,
                    onSubjectTap: (sub) => _onDisciplineTap(context, sub, stats),
                  ),
              ],
            ),
          ),
        );
      }
    );
  }
}