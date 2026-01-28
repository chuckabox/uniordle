import 'package:uniordle/core/app_icons.dart';
import 'package:uniordle/shared/exports/end_game_exports.dart';

class AbandonGameDialog extends StatelessWidget {
  const AbandonGameDialog({super.key});

  @override
  Widget build(BuildContext context) {

    return BaseDialog(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            AppIcons.abandonGame,
            color: Colors.orange,
            size: AppLayout.dialogIcon,
          ),
          const SizedBox(height: 16),
          Text(
            "ABANDON GAME?",
            style: AppFonts.displayLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            UserStatsExtension.getAbandonWarning(statsManager.statsNotifier.value.streak),
            style: AppFonts.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  label: 'CANCEL',
                  height: 48,
                  onPressed: () => Navigator.pop(context, false),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: PrimaryButton(
                  label: 'LEAVE',
                  height: 48,
                  color: AppColors.accent2,
                  onPressed: () => Navigator.pop(context, true),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.5),
      builder: (context) => const AbandonGameDialog(),
    ) ?? false;
  }
}