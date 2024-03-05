// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:tuple/tuple.dart';
import 'package:flame/experimental.dart';
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

    add(
      SpawnComponent(
        factory: (index) {
          return beer_bottle();
        },
        period: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -beer_bottle.enemySize),
      ),
    );
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

class recyclable_items extends SpriteComponent with HasGameRef<recycleSorter> {
  final List<Tuple2<String, Vector2>> sprite_list_with_sizes = [
    Tuple2('green_bottle.png', Vector2(18, 61)),
    Tuple2('large_can.png', Vector2(25, 42)),
    Tuple2('laundry_soap_bottle.png', Vector2(39, 62)),
    Tuple2('mason_jar.png', Vector2(26, 61)),
    Tuple2('newspaper.png', Vector2(56, 62)),
    Tuple2('piza_box.png', Vector2(61, 31)),
    Tuple2('plastic_bottle.png', Vector2(19, 62)),
    Tuple2('plastic_jug.png', Vector2(43, 62)),
    Tuple2('red_soda_can.png', Vector2(21, 42)),
    Tuple2('small_tuna_can.png', Vector2(24, 35)),
    Tuple2('spray_can.png', Vector2(21, 46)),
    Tuple2('brown_bag.png', Vector2(42, 62)),
    Tuple2('cardboard_box.png', Vector2(56, 62)),
    Tuple2('foam_cup.png', Vector2(31, 47)),
    Tuple2('broken_cup.png', Vector2(56, 62)),
    Tuple2('beer_bottle.png', Vector2(31, 47)),
  ];

  recyclable_items({
    super.position,
  }) : super(
          size: Vector2(18, 61),
          anchor: Anchor.center,
        );

  static const enemySize = 40.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('beer_bottle.png');
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * 300;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }
}
