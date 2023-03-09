import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:shooter_game_flutter/game/game.dart';

class BackgroundComponent extends ParallaxComponent<ShooterGame> {
  final _layersMeta = {
    'star1.png': 1.0,
    'star2.png': 1.5,
    'star3.png': 2.3,
    'star_4.png': 3.8,
  };

  @override
  FutureOr<void> onLoad() async {
    
    parallax = await gameRef.loadParallax([
      ParallaxImageData(
        "space1.png",
      ),
      ParallaxImageData(
        "space2.png",
      ),
      ParallaxImageData(
        "space3.png",
      ),
      ParallaxImageData(
        "space4.png",
      ),
      ParallaxImageData(
        "space5.png",
      ),
      ParallaxImageData(
        "space6.png",
      ),
    ],
        baseVelocity: Vector2(0, 25),
        velocityMultiplierDelta: Vector2(1, 1.5),
        repeat: ImageRepeat.repeatY,
        fill: LayerFill.width,
        alignment: Alignment.bottomCenter);
    size = gameRef.size;

    return super.onLoad();
  }
}
