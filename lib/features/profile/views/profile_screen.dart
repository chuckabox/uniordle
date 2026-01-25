import 'package:uniordle/shared/exports/profile_screen_exports.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const ProfileHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(child: SummaryCard(label: "Streak", value: currentStats.streak)),
              const SizedBox(width: 16),
              Expanded(child: SummaryCard(label: "Solved", value: currentStats.solved)),
              const SizedBox(width: 16),
              Expanded(child: SummaryCard(label: "Level", value: currentStats.level)),
            ],
          ),
        ),
      ],
    );
  }
}