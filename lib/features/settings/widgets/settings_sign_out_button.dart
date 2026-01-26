import 'package:uniordle/shared/exports/settings_exports.dart';
import 'package:uniordle/shared/buttons/select_button_wrapper.dart';

class SettingsSignOutButton extends StatelessWidget {
  final VoidCallback onTap;

  const SettingsSignOutButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
      child: SelectButtonWrapper(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            'SIGN OUT',
            textAlign: TextAlign.center,
            style: AppFonts.labelMedium.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}