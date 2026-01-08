import 'package:flutter/material.dart';

const _qwerty = [
  ['Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P'],
  ['A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L'],
  ['ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'DEL'],
];

class Keyboard extends StatelessWidget {
  const Keyboard({ 
    Key? key,
    required this.onKeyTapped,
    required this.OnDeleteTapped,
    required this.onEnterTapped,
  }): super(key: key);

  final void Function(String) onKeyTapped;

  final VoidCallback OnDeleteTapped;

  final VoidCallback onEnterTapped;

  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}