import 'package:uniordle/shared/exports/game_exports.dart';

class GameInfoBar extends StatelessWidget {
  final String disciplineName;
  final String yearLevel;
  final int wordLength;

  const GameInfoBar({
    super.key,
    required this.disciplineName,
    required this.yearLevel,
    required this.wordLength,
  });

  String get _attemptsLabel {
    const labels = {
      1: ('1st Year', '8'),
      2: ('2nd Year', '7'),
      3: ('3rd Year', '6'),
      4: ('Postgrad', '5'),
    };

    final match = labels.values.firstWhere(
      (element) => element.$1.toLowerCase() == yearLevel.toLowerCase(),
      orElse: () => ('', '6'),
    );

    return match.$2;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 468), 
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(child: InfoTag(label: disciplineName)),
              const SizedBox(width: 8),
              Expanded(child: InfoTag(label: '$wordLength LETTERS')),
              const SizedBox(width: 8),
              Expanded(
                child: InfoTag(
                  label: _attemptsLabel, 
                  icon: const Icon(Icons.favorite, size: 12, color: AppColors.onSurfaceVariant),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}