import 'package:flutter/material.dart';

class StartGameButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const StartGameButton({
    super.key, 
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: const Text('Start Game'),
      ),
    );
  }
}