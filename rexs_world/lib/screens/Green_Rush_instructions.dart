// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rexs_world/screens/Green_Rush_Load_Screen.dart';
import 'package:rexs_world/screens/recycle_sorter.dart';

class Green_Rush_Instructions extends StatelessWidget {
  const Green_Rush_Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            """ Great work Green Guardian! We scared the construction workers a little bit but they still have one more trick up their sleeves. 
            They found out that we don't use plastic bags at our grocery stores. We use reusable bags and if anyone forgets their bag then we give them a free one. 
            They decided to get rid of our reusable bags and replace them with plastic ones. You have 40 seconds to help me stop them by tapping on all of the plastic bags as fast as possible. """,
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Green_Rush_Load_Screen()));
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
