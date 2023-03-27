import 'dart:async';
import 'package:bloc/bloc.dart';
import './game_event.dart';
import './game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial());

  Stream<GameState> mapEventToState(
    GameEvent event,
  ) async* {
    if (event is StartEvent) {
      yield GameStarted();
    } else if (event is StopEvent) {
      yield GameStopped();
    }
  }
}
