import 'package:flutter/material.dart';

// Outer box
const double outerBoxWidth = 24;
const double outerBoxCorner = 12;

// Top bar
const double topBarHeight = 14;
const double topBarCorner = 12;
const Color topBarWinColor = Color(0xFF55B725);
const Color topBarLoseColor = Color(0xFFC62121);

// Stats box
const double statsHeight = 22;
const double statsCorner = 12;
const double textToStatPadding = 6;

// Button
const double buttonCorner = 4;
const Color buttonColor = topBarWinColor;

class EndGameDialog extends StatelessWidget {
  final bool won;
  final String solution;
  final int attempts;
  final VoidCallback onRestart;

  const EndGameDialog({
    required this.won,
    required this.solution,
    required this.attempts,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: _outerBoxWidth),
      backgroundColor: Color(0xFF1E2021),
      shape: RoundedRectangleBorder(
      // bottom of dialog corners
        borderRadius: BorderRadius.circular(_outerBoxCornerRounding),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: _topColourBarHeight),
            decoration: BoxDecoration(
              color: won ? Color(0xFF55B725) : Color(0xFFC62121),
              borderRadius: const BorderRadius.vertical(
              top: Radius.circular(_topColourBarCornerRounding),
              ),
            ),
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
            padding: const EdgeInsets.all(_innerBoxesWidthPadding),
            child: Column(
              children: [
                // top left label
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: _letterLengthLabelWidth,
                      vertical: _letterLengthLabelHeight,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(_letterLengthLabelCornerRounding),
                    ),
                    child: Text(
                      '${solution.length} letters',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: _letterLengthFontSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: _innerBoxBackgroundHeight),
                // two boxes
                Row(
                  children: [
                    Expanded(
                      child: _StatBox(
                        title: 'THE WORD WAS',
                        value: solution,
                      ),
                    ),
                    const SizedBox(width: _paddingBetweenTwoBoxes),
                    Expanded(
                      child: _StatBox(
                        title: 'ATTEMPTS', 
                        value: '$attempts',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: _paddingBetweenTwoBoxesToBottomBox),
                // button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onRestart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF55B725),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      )
                    ),
                    child: Text(
                      'New Game',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'clashdisplay',
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// two centre buttons
class _StatBox extends StatelessWidget {
  final String title;
  final String value;

  const _StatBox({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      padding: const EdgeInsets.symmetric(vertical: _statsHeight),
      decoration: BoxDecoration(
        color: const Color(0XFF2A2A2A),
        borderRadius: BorderRadius.circular(_statsCornerRounding),
        border: Border.all(color: Colors.white12),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: _textToStatPadding),
          Text(
          value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}