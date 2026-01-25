class UserStats {
  final String streak;
  final String solved;
  final String level;

  UserStats({
    required this.streak, 
    required this.solved, 
    required this.level
  });

}

final currentStats = UserStats(streak: "0", solved: "0", level: "0"); // temporary