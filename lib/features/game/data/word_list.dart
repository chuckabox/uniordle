import 'word_lists/engineering_words.dart';
import 'word_lists/medicine_words.dart';
import 'word_lists/cs_words.dart';
import 'word_lists/law_words.dart';

final Map<String, Map<int, List<String>>> categorizedWords = {
  'engineering': engineeringWords,
  'medicine': medicineWords,
  'cs': csWords,
  'law': lawWords,
};