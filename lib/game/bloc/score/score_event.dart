import 'package:equatable/equatable.dart';

abstract class ScoreEvent extends Equatable {
  const ScoreEvent();

  @override
  List<Object?> get props => [];
}

class ScoreIncreamentEvent extends ScoreEvent {}
