import 'package:uniordle/shared/exports/app_exports.dart';
import 'package:uniordle/shared/exports/game_setup_exports.dart';
import 'package:uniordle/features/home/models/major.dart';
import 'package:uniordle/core/app_icons.dart';

class GameSetupHero extends StatelessWidget {
  final Major major;

  const GameSetupHero({
    super.key,
    required this.major,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: AppColors.surfaceVariant,
            borderRadius: BorderRadius.circular(32),
          ),
          child: Icon(
            IconMapper.getIcon(major.icon),
            color: major.color,
            size: 48,
          ),
        ),
        SizedBox(height: context.r(8)),
        context.autoText(
          major.name,
          style: AppFonts.displayLarge,
        ),
        context.autoText(
          'GAME SETTINGS',
          style: AppFonts.labelLarge.copyWith(color: major.color),
        ),
      ],
    );
  }
}