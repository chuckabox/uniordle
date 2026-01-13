import 'package:flutter/material.dart';
import 'package:flutter_wordle/app/app_colors.dart';
import 'package:flutter_wordle/wordle/views/wordle_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeScreenBackground,
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const WordleScreen(),
              ),
            );
          },
          child: const Text(
            'Play Uniordle',
          ),
        ),
      ),
    );
  }
}