import 'package:uniordle/shared/home_screen_exports.dart';

/// Scale effect and Darken Effect on Click
class PumpButtonWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double pressScale;

  final bool enableDarken;
  final Color? baseColor;
  final double darkenIntensity;

  const PumpButtonWrapper({
    super.key,
    required this.child,
    this.onTap,
    this.pressScale = 0.96,
    this.enableDarken = false,
    this.baseColor,
    this.darkenIntensity = 0.15,
  });

  @override
  State<PumpButtonWrapper> createState() => _PumpButtonWrapperState();
}

class _PumpButtonWrapperState extends State<PumpButtonWrapper> {
  double _scale = 1.0;
  bool _isPressed = false;

  void _updateState(double scale, bool pressed) {
    if (widget.onTap != null) {
      setState(() {
        _scale = scale;
        _isPressed = pressed;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor = widget.baseColor;
    if (widget.enableDarken && widget.baseColor != null && _isPressed) {
      backgroundColor = Color.alphaBlend(
        Colors.black.withValues(alpha: widget.darkenIntensity),
        widget.baseColor!,
      );
    }

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _updateState(widget.pressScale, true),
      onTapUp: (_) => _updateState(1.0, false),
      onTapCancel: () => _updateState(1.0, false),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(KeyBoardConstants.keyRounding),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}