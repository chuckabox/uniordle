import 'package:uniordle/shared/exports/stats_exports.dart';

class GuessDistributionChart extends StatefulWidget {
  final Map<int, int> distribution;

  const GuessDistributionChart({
    super.key,
    required this.distribution,
  });

  @override
  State<GuessDistributionChart> createState() => _GuessDistributionChartState();
}

class _GuessDistributionChartState extends State<GuessDistributionChart> {
  bool _shouldAnimate = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          _shouldAnimate = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int maxCount = widget.distribution.values.fold(0, (max, e) => e > max ? e : max);
    if (maxCount == 0) maxCount = 1;

    return Column(
      children: List.generate(8, (index) {
        int guessNumber = index + 1;
        int count = widget.distribution[guessNumber] ?? 0;
        bool isHighest = count > 0 && count == maxCount;
        
        double widthFactor = _shouldAnimate ? (count / maxCount) : 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              SizedBox(
                width: 16,
                child: Text(
                  "$guessNumber",
                  style: AppFonts.labelSmall.copyWith(color: Colors.grey),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Container(
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.surfaceVariant,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeOutQuart,
                          height: 24,
                          width: _shouldAnimate 
                            ? (constraints.maxWidth * widthFactor).clamp(25.0, constraints.maxWidth)
                            : 25.0,
                          alignment: count == 0 ? Alignment.center : Alignment.centerRight,
                          padding: EdgeInsets.only(right: count == 0 ? 0 : 12),
                          decoration: BoxDecoration(
                            color: isHighest 
                                ? AppColors.accent 
                                : AppColors.onSurfaceVariant,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "$count",
                            style: AppFonts.labelSmall.copyWith(color: AppColors.onSurface),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}