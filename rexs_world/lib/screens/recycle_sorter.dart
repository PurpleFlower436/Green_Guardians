// ignore_for_file: prefer_const_constructors

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
//import 'package:flutter_animate/flutter_animate.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(GameWidget(game: recycleSorter()));
}

class recycleSorter extends FlameGame with PanDetector, KeyboardEvents {
  late Player player;
  @override
  Future<void> onLoad() async {
    await super.onLoad(); // loads the game

    if (kIsWeb) {
    } else if (Platform.isAndroid || Platform.isIOS) {}

    player = Player();

    add(NatureBackground()); //This adds the nature background to the screen
    add(player); //This adds the recycle bin sprite to the screen
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;

    if (isKeyDown && keysPressed.contains(LogicalKeyboardKey.altLeft)) {
      player.moveLeft();
    } else if (isKeyDown && keysPressed.contains(LogicalKeyboardKey.altRight)) {
      player.moveRight();
    }
    return KeyEventResult.handled;
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
  }
}

class Player extends SpriteComponent with HasGameRef<recycleSorter> {
  Player() : super(size: Vector2(200, 200), anchor: Anchor.bottomCenter);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('recycle_bin.png');
    position = Vector2(gameRef.size.x / 2, gameRef.size.y);
  }

  void moveLeft() {
    position.x -= 10;
  }

  void moveRight() {
    position.x += 10;
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
