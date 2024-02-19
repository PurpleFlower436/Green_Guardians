// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rexs_world/screens/beg_of_story.dart';

class titleScreen extends StatelessWidget {
  const titleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Rexs World",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 160),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => beg_of_story()));
            },
            child: Text("Play"),
          ),
        ],
      ),
    );
  }
}
