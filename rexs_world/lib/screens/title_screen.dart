// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:rexs_world/screens/beg_of_story.dart';


class titleScreen extends StatelessWidget {

  const titleScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    

    body: Center(
      child: Text("Rexs World",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    ),
     
    Center(
    child:ElevatedButton (child: Text("Start"),
    onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => beg_of_story(),
          ),
          );
          );
    }
    ),
    
  
  }
    
  

