import 'package:uniordle/shared/exports/game_exports.dart';
import 'package:uniordle/shared/exports/help_exports.dart';
import 'package:uniordle/shared/layout/base_badge.dart';

class UnlockedDisciplineDialog extends StatelessWidget {
  final Discipline discipline;

  const UnlockedDisciplineDialog({super.key, required this.discipline});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppLayout.maxDialogWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DisciplineIcon(
            iconName: discipline.icon,
            color: discipline.color,
            size: AppLayout.dialogIcon * 1.2,
          ),
          const SizedBox(height: 16),
          Text(
            "CONGRATULATIONS",
            style: AppFonts.displayMedium.copyWith(color: discipline.color),
          ),
          const SizedBox(height: 12),
          Text(
            "You have officially enrolled in the\n${discipline.name} Department.",
            textAlign: TextAlign.center,
            style: AppFonts.labelLarge,
          ),
          const SizedBox(height: 24),
          BaseBadge(
            label: "ENROLLMENT SUCCESS",
            icon: LucideIcons.checkCircle,
            color: discipline.color,
          ),
          const SizedBox(height: 32),
          PrimaryButton(
            onPressed: () => Navigator.pop(context),
            label: "START STUDYING",
            color: discipline.color,
          ),
        ],
      ),
    );
  }
}