import 'package:flutter/material.dart';

class GameButtonWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double pressScale; // how much it shrinks (e.g., 0.95)

  const GameButtonWrapper({
    super.key,
    required this.child,
    this.onTap,
    this.pressScale = 0.96,
  });

  @override
  State<GameButtonWrapper> createState() => _GameButtonWrapperState();
}

class _GameButtonWrapperState extends State<GameButtonWrapper> {
  double _scale = 1.0;

  void _updateScale(double scale) {
    if (widget.onTap != null) setState(() => _scale = scale);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _updateScale(widget.pressScale),
      onTapUp: (_) => _updateScale(1.0),
      onTapCancel: () => _updateScale(1.0),
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: widget.child,
      ),
    );
  }
}