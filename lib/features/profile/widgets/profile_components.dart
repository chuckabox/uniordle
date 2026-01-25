import 'package:uniordle/shared/exports/profile_screen_exports.dart';

class SummaryCard extends StatelessWidget {
  final String label, value;
  const SummaryCard({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceVariant, 
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            label.toUpperCase(), 
            style: AppTextStyles.labelMedium
          ),
          Text(
            value, 
            style: AppTextStyles.headline
          ),
        ],
      ),
    );
  }
}