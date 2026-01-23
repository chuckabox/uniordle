import '../data/possible_word/possible_5_letters.dart';
import '../data/possible_word/possible_6_letters.dart';
import '../data/possible_word/possible_7_letters.dart';

class WordRepository {
  static List<String> getWordsForLength(int length) {
    switch (length) {
      case 5:
        return possible5Letters;
      case 6:
        return possible6Letters;
      case 7:
        return possible7Letters;
      default:
        return [];
    }
  }

  static bool isValidWord(String word) {
    int length = word.length;
    List<String> validList = getWordsForLength(length);
    return validList.contains(word.toUpperCase());
  }
}