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
              "Green Guardians: Protect Dash's Home",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Playfair Display',
                  color: Color.fromARGB(255, 238, 176, 83)),
            ),
          ),
          SizedBox(height: 160),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => beg_of_story()));
            },
            child: Text("Start"),
          ),
        ],
      ),
    );
  }
}
