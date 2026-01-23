import 'package:uniordle/shared/buttons/primary_button.dart';
import 'package:uniordle/shared/exports/home_screen_exports.dart';
import 'package:uniordle/shared/layout/base_dialog.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('How to Play', style: AppTextStyles.headline),
          const SizedBox(height: 16),
          Text(
            'Guess the word in 6 tries.\n\n'
            'Green: Correct spot\n'
            'Yellow: Wrong spot\n'
            'Gray: Not in word',
            style: AppTextStyles.labelMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            label: 'GOT IT',
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}