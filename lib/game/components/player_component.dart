import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/foundation.dart';
import 'package:shooter_game_flutter/game/game.dart';

import 'bullet_component.dart';
import 'enemy_component.dart';
import 'explosive_component.dart';

class PlayerComponent extends SpriteComponent
    with HasGameRef<ShooterGame>, CollisionCallbacks {
  late TimerComponent bulletCreator;

  PlayerComponent()
      : super(
          size: Vector2(50, 75),
          position: Vector2(100, 500),
          anchor: Anchor.center,
        ) {
    kReleaseMode ? debugMode = false : debugMode = true;
  }

  @override
  FutureOr<void> onLoad() async {
    add(CircleHitbox());
    add(
      bulletCreator = TimerComponent(
        period: 0.1,
        repeat: true,
        autoStart: false,
        onTick: _createBullet,
      ),
    );
    sprite = await Sprite.load("player.png");

    size = Vector2(80, 80);
    return super.onLoad();
  }

  final _bulletAngles = [0.5, 0.3, 0.0, -0.5, -0.3];
  void _createBullet() {
    gameRef.addAll(
      _bulletAngles.map(
        (angle) => BulletComponent(
          position: position + Vector2(0, size.y / 2),
          angle: angle,
        ),
      ),
    );
  }

  void beginFire() {
    bulletCreator.timer.start();
  }

  void stopFire() {
    bulletCreator.timer.pause();
  }

  void takeHit() {
    gameRef.add(ExplosionComponent(position: position));
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is EnemyComponent) {
      other.takeHit();
    }
  }
}
