import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shooter_game_flutter/game/bloc/Game/game_bloc.dart';
import 'package:shooter_game_flutter/game/bloc/Game/game_state.dart';
import 'package:shooter_game_flutter/game/game.dart';
import 'package:shooter_game_flutter/screens/pause_screen.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  late final ShooterGame _game;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(builder: (context, state) {
      return Scaffold(
          body: state is GameStopped
              ? const PauseScreen()
              : GameWidget(
                  game: _game,
                  loadingBuilder: (_) => Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator.adaptive(),
                        SizedBox(
                          height: 20,
                        ),
                        Text('Loading'),
                      ],
                    ),
                  ),
                ));
    });
  }

  Future<void> _initialize() async {
    _game = ShooterGame();
  }
}
