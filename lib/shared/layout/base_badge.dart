import 'package:uniordle/shared/exports/game_exports.dart';

class BaseBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final double iconSize;

  const BaseBadge({
    super.key,
    required this.label,
    required this.icon,
    required this.color,
    this.iconSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(24),
        // border: Border.all(color: color.withValues(alpha: 0.1), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: color),
          const SizedBox(width: 8),
          Text(
            label.toUpperCase(),
            style: AppFonts.labelMedium.copyWith(
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}