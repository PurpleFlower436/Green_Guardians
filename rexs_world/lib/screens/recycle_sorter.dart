// ignore_for_file: prefer_const_constructors

import 'package:flame_audio/flame_audio.dart';
import 'package:flame/collisions.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_animate/flutter_animate.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(GameWidget(game: recycleSorter()));
}

class recycleSorter extends FlameGame
    with PanDetector, KeyboardEvents, HasCollisionDetection {
  late Player player;
  int score = 0;

  late Timer _timer;
  int _remainingTime = 40;

  late TextComponent score_text;

  late TextComponent time_counter_text;

  @override
  Future<void> onLoad() async {
    await super.onLoad(); // loads the game

    player = Player();

    await FlameAudio.audioCache.loadAll(
        ['game_level_music.wav', 'caught_recyclable.wav', 'catch_leaves.wav']);

    //FlameAudio.loop("game_level_music.wav");

    add(NatureBackground()); //This adds the nature background to the screen
    add(player); //This adds the recycle bin sprite to the screen

    add(
      SpawnComponent(
        factory: (index) {
          return plastic_bottle();
        },
        period: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -plastic_bottle.enemySize),
      ),
    );

    add(
      SpawnComponent(
        factory: (index) {
          return soda_can();
        },
        period: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -soda_can.enemySize),
      ),
    );

    add(
      SpawnComponent(
        factory: (index) {
          return newspaper();
        },
        period: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -newspaper.enemySize),
      ),
    );

    score_text = TextComponent(
        text: 'Score: $score',
        position: Vector2(5, 5),
        anchor: Anchor.topLeft,
        textRenderer: TextPaint(
            style: TextStyle(color: BasicPalette.black.color, fontSize: 30)));

    add(score_text);

    time_counter_text = TextComponent(
        text: 'Time: $_remainingTime secs',
        position: Vector2(205, 5), // You can adjust this position
        textRenderer: TextPaint(
            style: TextStyle(color: BasicPalette.black.color, fontSize: 30)));

    add(time_counter_text);

    _timer = Timer(1, repeat: true, onTick: () {
      if (_remainingTime == 0) {
        pauseEngine();
      } else {
        _remainingTime -= 1;
        time_counter_text.text = 'Time: $_remainingTime secs';
      }
    });
    _timer.start();
  }

  @override
  void update(double dt) {
    super.update(dt);
    _timer.update(dt);
  }

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is KeyDownEvent;
    // Determine if the key event is a key down event

    // Check if the left arrow key is pressed
    if (isKeyDown && keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      // move player to the left
      player.moveLeft();

      // Check if right arrow key is pressed
    } else if (isKeyDown &&
        keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
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
    add(RectangleHitbox(isSolid: true));
  }

  void moveLeft() {
    position.x -= 100;
  }

  void moveRight() {
    position.x += 100;
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

class plastic_bottle extends SpriteComponent
    with HasGameRef<recycleSorter>, CollisionCallbacks {
  plastic_bottle({
    super.position,
  }) : super(
          size: Vector2(19, 62),
          anchor: Anchor.center,
        );

  static const enemySize = 40.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('plastic_bottle.png');

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * 350;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Player) {
      removeFromParent(); //This helps to remove the plastic bottle from the screen
      //other.removeFromParent();
      gameRef.score += 10;
      gameRef.score_text.text = 'Score: ${gameRef.score}';
      FlameAudio.play('caught_recyclable.wav');
    }
  }
}

class soda_can extends SpriteComponent
    with HasGameRef<recycleSorter>, CollisionCallbacks {
  soda_can({
    super.position,
  }) : super(
          size: Vector2(19, 62),
          anchor: Anchor.center,
        );

  static const enemySize = 40.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('red_soda_can.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * 350;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Player) {
      removeFromParent(); //This helps to remove the plastic bottle from the screen
      //other.removeFromParent();
      gameRef.score += 10;
      gameRef.score_text.text = 'Score: ${gameRef.score}';
      FlameAudio.play('caught_recyclable.wav');
    }
  }
}

class newspaper extends SpriteComponent
    with HasGameRef<recycleSorter>, CollisionCallbacks {
  newspaper({
    super.position,
  }) : super(
          size: Vector2(56, 62),
          anchor: Anchor.center,
        );

  static const enemySize = 40.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    sprite = await gameRef.loadSprite('newspaper.png');
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    position.y += dt * 350;

    if (position.y > game.size.y) {
      removeFromParent();
    }
  }

  @override
  void onCollisionStart(
    Set<Vector2> intersectionPoints,
    PositionComponent other,
  ) {
    super.onCollisionStart(intersectionPoints, other);

    if (other is Player) {
      removeFromParent(); //This helps to remove the plastic bottle from the screen
      //other.removeFromParent();
      gameRef.score += 10;
      gameRef.score_text.text = 'Score: ${gameRef.score}';
      FlameAudio.play('caught_recyclable.wav');
    }
  }
}
