import 'package:flutter/material.dart';
import 'package:uniordle/shared/buttons/select_button_wrapper.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color color;
  final bool isLoading;
  final IconData? icon;
  final double height;
  final double borderRadius;
  final bool showShadow;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.color,
    this.isLoading = false,
    this.icon,
    this.height = 60,
    this.borderRadius = 16,
    this.showShadow = false,
  });

  @override
  Widget build(BuildContext context) {

  }
}