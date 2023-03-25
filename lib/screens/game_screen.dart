import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:shooter_game_flutter/game/game.dart';

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
    return Scaffold(
        body: GameWidget(
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
  }

  Future<void> _initialize() async {
    _game = ShooterGame();
  }
}
