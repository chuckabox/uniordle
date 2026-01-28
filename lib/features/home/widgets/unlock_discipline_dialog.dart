import 'package:uniordle/features/home/widgets/unlocked_discipline_dialog.dart';
import 'package:uniordle/shared/exports/game_exports.dart';
import 'package:uniordle/shared/exports/help_exports.dart';
import 'package:uniordle/shared/buttons/wiggle_button_wrapper.dart';

class UnlockDisciplineDialog extends StatefulWidget {
  final Discipline discipline;
  final int credits;
  final int nextLevel;

  const UnlockDisciplineDialog({
    super.key,
    required this.discipline,
    required this.credits,
    required this.nextLevel,
  });

  @override
  State<UnlockDisciplineDialog> createState() => _UnlockDisciplineDialogState();
}

class _UnlockDisciplineDialogState extends State<UnlockDisciplineDialog> {
  bool _isUnlocked = false;
  final wiggleKey = GlobalKey<WiggleButtonWrapperState>();

  void _handleUnlock() async {
    await statsManager.unlockDiscipline(widget.discipline.id);
    
    if (mounted) {
      setState(() {
        _isUnlocked = true;
      });
    }
    
    // TODO: change to victory
    SoundManager().play(SoundType.grid);
  }

  @override
  Widget build(BuildContext context) {
    if (_isUnlocked) {
      return UnlockedDisciplineDialog(discipline: widget.discipline);
    }

    final bool canAfford = widget.credits > 0;
    final Color buttonColor = canAfford 
        ? widget.discipline.color 
        : AppColors.onSurfaceVariant.withValues(alpha: 0.5);
    final Color statusColor = canAfford 
        ? widget.discipline.color 
        : AppColors.onSurfaceVariant.withValues(alpha: 0.5);

    final wiggleKey = GlobalKey<WiggleButtonWrapperState>();

    return SizedBox(
      width: AppLayout.maxDialogWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DisciplineIcon(
            iconName: canAfford ? widget.discipline.icon : 'lock',
            color: statusColor,
            size: AppLayout.dialogIcon,
          ),
          const SizedBox(height: 8),
      
          Text(
            canAfford ? "Enroll in ${widget.discipline.name}?" : "LOCKED",
            style: AppFonts.displayMedium,
          ),
          const SizedBox(height: AppLayout.titleToSubtitle),
          
          Text(
            canAfford 
              ? "Spend 1 Credit to unlock ${widget.discipline.name}?"
              : "You don't have any credits to unlock ${widget.discipline.name}.",
            textAlign: TextAlign.center,
            style: AppFonts.labelLarge,
          ),
          
          const SizedBox(height: 8),
          
          Column(
            children: [
              if (!canAfford) ...[
                Text(
                  "Next Credit at Level ${widget.nextLevel}",
                  style: AppFonts.labelMedium,
                ),
              ],
            ],
          ),
      
          const SizedBox(height: AppLayout.gapToButton),
      
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  onPressed: () => Navigator.pop(context),
                  label: "BACK",
                ),
              ),
              const SizedBox(width: AppLayout.gapBetweenButtons),
              Expanded(
                child: WiggleButtonWrapper(
                  key: wiggleKey, 
                  child: PrimaryButton(
                    label: "UNLOCK",
                    color: buttonColor,
                    onPressed: () {
                      if (canAfford) {
                        _handleUnlock();
                      } else {
                        wiggleKey.currentState?.wiggle();
      
                        // TODO: change sound to negative
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
}