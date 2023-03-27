import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shooter_game_flutter/game/bloc/Game/game_bloc.dart';
import 'package:shooter_game_flutter/game/bloc/Game/game_state.dart';
import 'package:shooter_game_flutter/game/bloc/score/score_bloc.dart';
import 'package:shooter_game_flutter/game/bloc/score/score_state.dart';

class PauseScreen extends StatefulWidget {
  const PauseScreen({super.key});

  @override
  State<PauseScreen> createState() => _PauseScreenState();
}

class _PauseScreenState extends State<PauseScreen> {
  final GameBloc gameBloc = GameBloc();
  @override
  Widget build(BuildContext context) {
    final double deviceH = MediaQuery.of(context).size.height;
    final double deviceW = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ScoreBloc, ScoreState>(builder: (context, state) {
          return Container(
            child: Column(
              children: [
                Text("Score: ${state.score}"),
                BlocBuilder<GameBloc, GameState>(builder: (context, gState) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        gameBloc.close();
                      },
                      child: Container(
                        width: deviceW * 0.4,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        child: const Text(
                          "Play",
                          style: TextStyle(
                            fontSize: 24,
                            fontFamily: "Permanent Marker",
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
