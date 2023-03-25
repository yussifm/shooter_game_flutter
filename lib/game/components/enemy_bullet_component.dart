import 'dart:async';

import 'package:flame/components.dart';

class EnemyBulletComponent extends SpriteComponent with HasGameRef {
  
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("opponent-bullet.png");
    position = gameRef.size * 0.3;
    
    size = Vector2(gameRef.size.x * 0.02, gameRef.size.y * 0.02);
    return super.onLoad();
  }
}
