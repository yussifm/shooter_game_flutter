import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shooter_game_flutter/game/bloc/score/score_event.dart';
import 'package:shooter_game_flutter/game/bloc/score/score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(ScoreState.initial()) {
    on<ScoreIncreamentEvent>((event, emit) {
      emit(state.copyWith(score: state.score + 1));
    });
  }
}
