

import 'dart:async';

import 'package:flame/components.dart';
import 'package:shooter_game_flutter/game/game.dart';

class EnemyComponent extends SpriteComponent with HasGameRef<ShooterGame> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("opponent.png");
    position = gameRef.size * 0.2;
    size = Vector2(40, 40);
    return super.onLoad();
  }
}



