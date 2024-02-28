// ignore_for_file: prefer_const_constructors

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_animate/flutter_animate.dart';
import 'package:flame/input.dart';

void main() {
  runApp(GameWidget(game: recycleSorter()));
}

class recycleSorter extends FlameGame with PanDetector {
  late Player player;
  @override
  Future<void> onLoad() async {
    await super.onLoad();

    player = Player();
    add(player);
    add(NatureBackground());
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }
}

class Player extends SpriteComponent with HasGameRef<recycleSorter> {
  Player()
      : super(
          size: Vector2(200, 200),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('recycle_bin.png');
    position = gameRef.size / 6;
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}

class NatureBackground extends SpriteComponent with HasGameRef<recycleSorter> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game_background.jpeg');
    size = gameRef.size;
  }
}
