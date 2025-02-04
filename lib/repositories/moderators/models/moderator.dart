import 'package:equatable/equatable.dart';

class Moderator extends Equatable {
  Moderator({
    required this.name,
    required this.rank,
    required this.level,
    required this.playedSeconds,
  });

  final String name;
  final String rank;
  final int level;
  final int playedSeconds;

  factory Moderator.fromJson(Map<String, dynamic> json) {
    return Moderator(
      name: json['username'],
      rank: json['rank'],
      level: json['level'],
      playedSeconds: json['playedSeconds'],
    );
  }

  @override
  List<Object?> get props => [name, rank, level, playedSeconds];
}
