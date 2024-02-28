// ignore_for_file: camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rexs_world/screens/recycle_sorter.dart';
import 'package:rexs_world/screens/recyle_sorter_load_screen.dart';

class beg_of_story extends StatelessWidget {
  const beg_of_story({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              """ Hello! My name is Dash and my world is in danger. My home is in a beautiful land where ne and my animal friends live in peace and harmony. Our town runs on sustainability which allows us to ensure our town is safe from dangers. But I heard that some evil construction workers want to bulldoze our town and build a mansion on it. 
              Help me stop them by completing these 3 challenges so we can save my home!""",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 90),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => GameScreen()));
            },
            child: Text("Play"),
          ),
        ],
      ),
    );
  }
}
