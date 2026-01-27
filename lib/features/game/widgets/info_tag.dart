import 'package:uniordle/shared/exports/game_exports.dart';

class InfoTag extends StatelessWidget {
  final String label;
  final Color borderColor;
  final Color backgroundColor;
  final Widget? icon;

  const InfoTag({
    super.key, 
    required this.label, 
    this.borderColor = AppColors.onSurfaceVariant, 
    this.backgroundColor = AppColors.surfaceVariant,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor.withValues(alpha: 0.4),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              label.toUpperCase(),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppFonts.labelMedium,
            ),
          ),
          if (icon != null) ...[
            const SizedBox(width: 4),
            icon!,
          ],
        ],
      ),
    );
  }
}