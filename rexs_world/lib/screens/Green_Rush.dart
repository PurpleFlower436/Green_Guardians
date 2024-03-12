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
import 'package:rexs_world/screens/Green_Rush_Instructions.dart';

void main() {
  runApp(GameWidget(game: Green_Rush()));
}

class Green_Rush extends FlameGame
    with PanDetector, KeyboardEvents, HasCollisionDetection {}
