import 'package:equatable/equatable.dart';

class ScoreState extends Equatable {
  final int score;
  const ScoreState({required this.score});

  @override
  List<Object> get props => [score];

  ScoreState copyWith({
    int? score,
  }) {
    return ScoreState(
      score: score ?? this.score,
    );
  }

  factory ScoreState.initial() => const ScoreState(score: 0);

  @override
  String toString() => 'ScoreState(score: $score)';
}

// class ScoreInit extends ScoreState {
//   final int score;

//   ScoreInit({required this.score});
// }

// class ScoreIncreaseState extends ScoreState {
//   int score;

//   ScoreIncreaseState({required this.score});
// }
