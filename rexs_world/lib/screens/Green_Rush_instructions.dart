// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rexs_world/screens/recycle_sorter.dart';

class GreenRushInstructions extends StatelessWidget {
  //static const String ID = 'GreenRushInstructions';
  final recycleSorter game;

  const GreenRushInstructions({super.key, required this.game});

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            """ Hello! My name is Dash and my world is in danger. My home is in a beautiful land where ne and my animal friends live in peace and harmony. Our town runs on sustainability which allows us to ensure our town is safe from dangers. But I heard that some evil construction workers want to bulldoze our town and build a mansion on it. 
              Help me stop them by completing these 2 challenges so we can save my home!""",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ).animate().scale(duration: 500.ms)),
          // ignore: prefer_const_constructors
          Image(
              image: AssetImage('assets/images/Dashatar_Bonus_NakedDash.png')),
          SizedBox(height: 90),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GameScreen()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 166, 231, 151),
            ),
            child: Text(
              "Play",
              style: TextStyle(
                  fontSize: 50, color: Color.fromARGB(255, 238, 176, 83)),
            ),
          )
        ],
      ),
    );
  }
}












}
