class UserStats {
  final int streak;
  final int solved;

  UserStats({
    required this.streak, 
    required this.solved, 
  });
}

final currentStats = UserStats(streak: 0, solved: 14); // temporary