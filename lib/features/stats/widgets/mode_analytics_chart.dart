import 'package:uniordle/shared/exports/stats_exports.dart';

class ModeAnalyticsChart extends StatelessWidget {
  final Map<String, int> modeFrequency;

  const ModeAnalyticsChart({super.key, required this.modeFrequency});

  @override
  Widget build(BuildContext context) {
    final maxUsage = modeFrequency.values.isEmpty 
        ? 1 
        : modeFrequency.values.reduce((a, b) => a > b ? a : b);

    return Column(
      children: [
        _buildHeaderRow(),
        const SizedBox(height: 8),
        ...[5, 6, 7].map((len) => _buildDataRow(len, maxUsage)),
      ],
    );
  }

  Widget _buildHeaderRow() {
    return Row(
      children: [
        const SizedBox(width: 40),
        ...[8, 7, 6, 5].map((tries) => Expanded(
          child: Text("$tries Tries", 
            textAlign: TextAlign.center, 
            style: AppFonts.labelSmall.copyWith(fontSize: 10))
        )),
      ],
    );
  }

  Widget _buildDataRow(int length, int maxUsage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(width: 40, child: Text("${length}L", style: AppFonts.labelMedium)),
          ...[8, 7, 6, 5].map((tries) {
            final count = modeFrequency["$length-$tries"] ?? 0;
            final opacity = count == 0 ? 0.05 : (count / maxUsage).clamp(0.1, 1.0);
            
            return Expanded(
              child: Container(
                height: 30,
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: opacity),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Text(count > 0 ? "$count" : "-", 
                    style: AppFonts.labelSmall.copyWith(
                      color: opacity > 0.5 ? Colors.white : AppColors.onSurface
                    )),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}