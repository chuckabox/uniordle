import 'package:uniordle/features/help/widgets/instruction_row.dart';
import 'package:uniordle/shared/buttons/primary_button.dart';
import 'package:uniordle/shared/exports/home_screen_exports.dart';
import 'package:uniordle/shared/layout/base_dialog.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'HOW TO PLAY', 
            style: AppTextStyles.headline
          ),
          const SizedBox(height: 8),
          Text(
            'Choose a category, customise your settings, then guess the word!',
            style: AppTextStyles.labelMedium.copyWith(
              color: Colors.white70,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          InstructionRow(letter: 'W', color: AppColors.correctColor, title: 'Correct', subtitle: 'Right Spot'),
          const SizedBox(height: 16),
          InstructionRow(letter: 'I', color: AppColors.inWordColor, title: 'Eh', subtitle: 'Wrong Spot'),
          const SizedBox(height: 16),
          InstructionRow(letter: 'N', color: AppColors.notInWordColor, title: 'Incorrect', subtitle: 'Not in any Spot'),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
                label: 'GOT IT',
                onPressed: () => Navigator.pop(context),
                borderRadius: 24,
            ),
          ),
        ],
      )
    );
  }
}