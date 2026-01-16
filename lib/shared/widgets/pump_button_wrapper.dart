import 'package:flutter/material.dart';

class PumpButtonWrapper extends StatefulWidget {
  final Widget Function(bool isPressed) builder;
  final VoidCallback? onTap;
  final double pressScale; // how much it shrinks (e.g., 0.95)

  const PumpButtonWrapper({
    super.key,
    required this.builder,
    this.onTap,
    this.pressScale = 0.96,
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
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _updateState(widget.pressScale, true),
      onTapUp: (_) => _updateState(1.0, false),
      onTapCancel: () => _updateState(1.0, false),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: widget.builder(_isPressed),
      ),
    );
  }
}