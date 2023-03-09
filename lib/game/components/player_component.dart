import 'dart:async';

import 'package:flame/components.dart';
import 'package:shooter_game_flutter/game/game.dart';

class PlayerComponent extends SpriteComponent with HasGameRef<ShooterGame> {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("player.png");
    position = gameRef.size / 2;
    size = Vector2(80, 80);
    return super.onLoad();
  }
}
