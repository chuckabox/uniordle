import 'package:uniordle/shared/exports/home_exports.dart';
import 'package:uniordle/core/app_icons.dart';

class MajorIcon extends StatelessWidget {
  final String iconName;
  final Color? color;
  final double size;

  const MajorIcon({
    super.key, 
    required this.iconName, 
    required this.color,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    final double containerSize = size + 16;

    return Container(
      width: containerSize,
      height: containerSize,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(IconMapper.getIcon(iconName), color: color, size: size),
    );
  }
}
