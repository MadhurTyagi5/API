class Profile {
  final String username;
  final int reputation;
  final int totalSolved;
  final int easySolved;
  final int mediumSolved;
  final int hardSolved;

  const Profile({
    required this.username,
    required this.reputation,
    required this.totalSolved,
    required this.easySolved,
    required this.mediumSolved,
    required this.hardSolved,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        username: json['username'] as String,
        reputation: json['reputation'] as int,
        totalSolved: json['totalSolved'] as int,
        easySolved: json['easySolved'] as int,
        mediumSolved: json['mediumSolved'] as int,
        hardSolved: json['hardSolved'] as int,
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'reputation': reputation,
        'totalSolved': totalSolved,
        'easySolved': easySolved,
        'mediumSolved': mediumSolved,
        'hardSolved': hardSolved,
      };
}
