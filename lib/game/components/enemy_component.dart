import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:shooter_game_flutter/game/components/bullet_component.dart';
import 'package:shooter_game_flutter/game/game.dart';

import 'explosive_component.dart';

class EnemyComponent extends SpriteComponent
    with HasGameRef<ShooterGame>, CollisionCallbacks {
  static const speed = 150;
  static Vector2 initialSize = Vector2.all(25);

  EnemyComponent({required super.position})
      : super(size: initialSize, anchor: Anchor.center);

      
  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load("opponent.png");
    size = Vector2(40, 40);
    add(CircleHitbox()..collisionType = CollisionType.passive);
    return super.onLoad();
  }

 

  @override
  void update(double dt) {
    super.update(dt);

    y += speed * dt;
    if (y >= gameRef.size.y) {
      removeFromParent();
    }
  }

  void takeHit() {
    removeFromParent();

    gameRef.add(ExplosionComponent(position: position));
    gameRef.increaseScore();
  }
  
}
