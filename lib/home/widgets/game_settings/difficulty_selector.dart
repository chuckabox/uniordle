import 'package:flutter/material.dart';

const _labels = {
  1: ('First Year', 'Easy'),
  2: ('Second Year', 'Medium'),
  3: ('Third Year', 'Hard'),
  4: ('Postgrad', 'Expert'),
};

class DifficultySelector extends StatelessWidget {
  final int value;
  final ValueChanged<int> onChanged;

  const DifficultySelector({
    super.key, 
    required this.value, 
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'DIFFICULTY LEVEL',
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 11,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
        Slider(
          value: value.toDouble(),
          min: 1,
          max: 4,
          divisions: 3,
          onChanged: (v) => onChanged(v.round()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _labels.entries.map((e) {
            final active = e.key == value;
            return Column(
              children: [
                Text(
                  e.value.$1,
                  style: TextStyle(
                    color: active ? Colors.white : Colors.blueGrey,
                  ),
                ),
                Text(
                  e.value.$2,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 10,
                  ),
                ),
              ],
            );
          }).toList()
        ),
      ],
    );
  }
}