import 'dart:ui';
import 'package:uniordle/shared/exports/game_screen_exports.dart';

class BaseDialog extends StatelessWidget {
  final Widget child;
  final double blur;

  const BaseDialog({
    super.key,
    required this.child,
    this.blur = 6.0,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20),
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
          child: child,
        ),
      ),
    );
  }
}