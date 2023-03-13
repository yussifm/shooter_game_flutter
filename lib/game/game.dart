import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:shooter_game_flutter/game/components/background_component.dart';
import 'package:shooter_game_flutter/game/components/player_component.dart';

import 'components/create_enemy_component.dart';

class ShooterGame extends FlameGame with PanDetector, HasCollisionDetection {
  late final PlayerComponent player;
  late final TextComponent componentCounter;
  late final TextComponent scoreText;

  int score = 0;

  @override
  FutureOr<void> onLoad() {
    FlameAudio.audioCache.loadAll(
        ["space-wind.mp3", "SHOOT001.mp3", "SHOOT009.mp3", "fallingStar.mp3"]);
    add(BackgroundComponent());
    addAll([
      FpsTextComponent(
        position: size - Vector2(0, 50),
        anchor: Anchor.bottomRight,
      ),
      scoreText = TextComponent(
        position: size - Vector2(0, 25),
        anchor: Anchor.bottomRight,
        priority: 1,
      ),
      componentCounter = TextComponent(
        position: size,
        anchor: Anchor.bottomRight,
        priority: 1,
      ),
    ]);

    add(EnemyCreator());
    add(player = PlayerComponent());

    FlameAudio.loop("space-wind.mp3", volume: 0.4);
    FlameAudio.loopLongAudio("fallingStar.mp3", volume: 0.6);
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);

    scoreText.text = 'Score: $score';
    componentCounter.text = 'Components: ${children.length}';
  }

  @override
  void onPanStart(info) {
    player.beginFire();
    FlameAudio.play("SHOOT001.mp3");
  }

  @override
  void onPanEnd(info) {
    player.stopFire();
  }

  @override
  void onPanCancel() {
    player.stopFire();
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.position += info.delta.game;
  }

  void increaseScore() {
    score++;
  }
}
