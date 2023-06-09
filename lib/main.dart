import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shooter_game_flutter/game/bloc/Game/game_bloc.dart';
import 'package:shooter_game_flutter/game/bloc/score/score_bloc.dart';
import 'package:shooter_game_flutter/game/game.dart';
import 'package:shooter_game_flutter/screens/menu_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ScoreBloc>(
          create: (context) => ScoreBloc(),
        ),
        BlocProvider<GameBloc>(
          create: (context) => GameBloc(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Flame demo',
      debugShowCheckedModeBanner: false,
      home: MenuScreen(),
    );
  }
}

// class GamePage extends StatefulWidget {
//   const GamePage({super.key});

//   @override
//   State<GamePage> createState() => _GamePageState();
// }

// class _GamePageState extends State<GamePage> {
//   late final ShooterGame _game;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: GameWidget(
//       game: _game,
//       loadingBuilder: (_) => Center(
//         child: Column(
//           children: const [
//             CircularProgressIndicator.adaptive(),
//             SizedBox(
//               height: 20,
//             ),
//             Text('Loading'),
//           ],
//         ),
//       ),
//     )
//     );
//   }


  
// }
