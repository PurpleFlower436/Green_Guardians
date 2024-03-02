// ignore_for_file: prefer_const_constructors

import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';

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
    // Determine if the key event is a key down event

    // Check if the left arrow key is pressed
    if (isKeyDown && keysPressed.contains(LogicalKeyboardKey.altLeft)) {
      // move player to the left
      player.moveLeft();

      // Check if right arrow key is pressed
    } else if (isKeyDown && keysPressed.contains(LogicalKeyboardKey.altRight)) {
      // move player to the right
      player.moveRight();
      // Since we hadnled the key event, return handled
      return KeyEventResult.handled;
    }
    //If the key event doesnt match any of the conditions above,
    // return 'ignored' to indicate that the event was not handled
    return KeyEventResult.ignored;
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    super.onPanUpdate(info);

    player.position.x += info.delta.global.x;
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
}

class NatureBackground extends SpriteComponent with HasGameRef<recycleSorter> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite('game_background.jpeg');
    size = gameRef.size;
  }
}

class recylable_items extends SpriteAnimationComponent
    with HasGameRef<recycleSorter> {}
