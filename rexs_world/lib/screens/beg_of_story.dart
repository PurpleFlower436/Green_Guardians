// ignore_for_file: camel_case_types, prefer_const_constructors

import  'package:flutter/material.dart';


class beg_of_story extends StatelessWidget {

  const beg_of_story({super.key});
  
 


@override 
Widget build(BuildContext context) {

  // ignore: prefer_const_constructors
  return Scaffold(
    body: Center(
      child: Align(
        alignment: Alignment.center,
        child: Text(""" Hello! My name is Rex and my world is in danger. My home is in a beautiful land where ne and my animal friends live in peace and harmony. Our town runs on sustainability which allows us to ensure our town is safe from dangers. But I heard that some evil construction workers want to bulldoze our town and build a mansion on it. Help me stop them by completing these 3 challenges so we can save my home! 
      The construction workers saw that all of us recycle so they thought they could dump trash everywhere to scare us away. But they don't know that we are the kings of recycling! """,
       style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
      ))
  )
  );
}
}