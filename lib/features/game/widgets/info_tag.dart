import 'package:uniordle/shared/exports/game_screen_exports.dart';

class InfoTag extends StatelessWidget {
  final String label;
  final Color color;

  const InfoTag({
    super.key, 
    required this.label, required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: color.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Text(
        label.toUpperCase(),
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: GameFonts.infoBarText,
      ),
    );
  }
}