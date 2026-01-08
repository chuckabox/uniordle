import 'package:equatable/equatable.dart';
import 'package:flutter_wordle/wordle/wordle.dart';

class Word extends Equatable {
  const Word({required this.letters});

  factory Word.fromString(String word) =>
    Word(letters: word.split('').map((e) => Letter(val: e)).toList());

  final List<Letter> letters;
    
  String get wordString => letters.map((e) => e.val).join();

  

}