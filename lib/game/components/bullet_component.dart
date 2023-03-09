import 'dart:async';

import 'package:flame/components.dart';

class BulletComponent extends SpriteComponent with HasGameRef {
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("player-bullet.png");
    position = gameRef.size / 2;
    size = Vector2(gameRef.size.x * 0.02, gameRef.size.y * 0.02);
    return super.onLoad();
  }
}
