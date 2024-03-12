import 'package:flutter/material.dart';
import 'package:flame/game.dart';

import 'Green_Rush.dart';

class Green_Rush_Load_Screen extends StatelessWidget {
  const Green_Rush_Load_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GameWidget(game: Green_Rush()));
  }
}
