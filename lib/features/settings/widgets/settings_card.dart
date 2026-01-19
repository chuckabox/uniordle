import 'package:uniordle/shared/exports/settings_exports.dart';

class SettingsCard extends StatelessWidget {
  final List<Widget> children;

  const SettingsCard({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mainBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.backgroundBorder.withValues(alpha: 0.6)),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}