import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:shooter_game_flutter/game/components/enemy_component.dart';

class BulletComponent extends SpriteComponent
    with HasGameRef, CollisionCallbacks {
  static const speed = 300.0;
  late final Vector2 velocity;
  final Vector2 deltaPosition = Vector2.zero();

  BulletComponent({required super.position, super.angle})
      : super(size: Vector2(10, 20));

  @override
  FutureOr<void> onLoad() async {
    add(CircleHitbox());
    sprite = await Sprite.load("player-bullet.png");
    size = Vector2(gameRef.size.x * 0.02, gameRef.size.y * 0.02);
    velocity = Vector2(0, -1)
      ..rotate(angle)
      ..scale(speed);
    return super.onLoad();
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is EnemyComponent) {
      other.takeHit();
      removeFromParent();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    deltaPosition
      ..setFrom(velocity)
      ..scale(dt);
    position += deltaPosition;

    if (position.y < 0 ||
        position.x > gameRef.size.x ||
        position.x + size.x < 0) {
      removeFromParent();
    }
  }
}
