import 'dart:math';

import 'package:flame/components.dart';

import 'enemy_component.dart';

class EnemyCreator extends TimerComponent with HasGameRef {
  final Random random = Random();
  final _halfWidth = EnemyComponent.initialSize.x / 2;

  EnemyCreator() : super(period: 0.90, repeat: true);

  @override
  void onTick() {
    gameRef.addAll(
      List.generate(
        3,
        (index) => EnemyComponent(
          position: Vector2(
            _halfWidth + (gameRef.size.x - _halfWidth) * random.nextDouble(),
            0,
          ),
        ),
      ),
    );
  }
}
