<<<<<<< HEAD
import 'package:flutter/material.dart';

=======
import 'package:uniordle/features/game/widgets/end_game/attempts_info.dart';
import 'package:uniordle/features/game/widgets/end_game/end_dialog_header.dart';
import 'package:uniordle/features/game/widgets/end_game/solution_box.dart';
import 'package:uniordle/features/home/models/discipline.dart';
import 'package:uniordle/shared/buttons/primary_button.dart';
import 'package:uniordle/shared/exports/game_screen_exports.dart';

/// Dialog shown when game ends
/// 
/// Displays win or loss, solution world, attempt count,
/// and actions to restart or go back to main menu
>>>>>>> 6d9d5d68b8271cf6094d0f9e263324dc24dcf12c
class EndGameDialog extends StatelessWidget {
  final bool won;
  final String solution;
  final int attempts;
  final int maxAttempts;
  final String yearLevel;
  final Discipline discipline;
  final VoidCallback onRestart;

  const EndGameDialog({
    super.key,
    required this.won,
    required this.solution,
    required this.attempts,
    required this.maxAttempts,
    required this.yearLevel,
    required this.discipline,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
<<<<<<< HEAD
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // top bar
          Container(
            width: double.infinity, // expands dialog box width
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              won ? 'You Won!' : 'Game Over',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'clashdisplay',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // content
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20, 
              vertical: 20,
            ), // inner boxes width padding
            child: Column(
              children: [
                // top left label
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF27282A),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              offset: const Offset(0, 3),
                              blurRadius: 6,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Text(
                          '${solution.length} Letters',
                          style: const TextStyle(
                            color: Color(0xFFB0B4B7),
                            fontSize: 14,
                            fontFamily: 'dm-sans',
                            fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                // two boxes
                const SizedBox(height: 16), // space between letters container and two stat boxes
                Row(
                  children: [
                    
                    const SizedBox(width: 16), // padding between two boxes
                    
                  ],
                ),
                const SizedBox(height: 32), // padding between two boxes to bottom box 
                // butto
=======
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DialogHeader(won: won),
            const SizedBox(height: 24),
            SolutionBox(solution: solution),
            const SizedBox(height: 24),
            AttemptsInfo(attempts: attempts, maxAttempts: maxAttempts),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(child: InfoTag(label: discipline.name)),
                const SizedBox(width: 8),
                Expanded(child: InfoTag(label: '${solution.length} LETTERS')),
                const SizedBox(width: 8),
                Expanded(child: InfoTag(label: yearLevel.toUpperCase())),
>>>>>>> 6d9d5d68b8271cf6094d0f9e263324dc24dcf12c
              ],
            ),
            const SizedBox(height: 32),
            PrimaryButton(
              label: 'NEW GAME',
              color: AppColors.accent,
              onPressed: onRestart,
            ),
            const SizedBox(height: 12),
            PrimaryButton(
              label: 'HOME',
              color: AppColors.surfaceVariant,
              onPressed: () => Navigator.pop(context),
            ),

          ],
        ),
      ),
    );
  }
}