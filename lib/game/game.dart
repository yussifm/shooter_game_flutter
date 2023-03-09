import 'dart:async';

import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:shooter_game_flutter/game/components/background_component.dart';
import 'package:shooter_game_flutter/game/components/bullet_component.dart';
import 'package:shooter_game_flutter/game/components/enemy_bullet_component.dart';
import 'package:shooter_game_flutter/game/components/enemy_component.dart';
import 'package:shooter_game_flutter/game/components/player_component.dart';

class ShooterGame extends FlameGame with PanDetector, HasCollisionDetection {
  @override
  FutureOr<void> onLoad() {
    add(BackgroundComponent());
    add(PlayerComponent());
    add(BulletComponent());
    add(EnemyComponent());
    add(EnemyBulletComponent());
    return super.onLoad();
  }


  @override
  void update(double dt) {
    super.update(dt);
  }
}
