
import 'package:flutter/material.dart';
import 'screen/home_screen.dart';
import 'screen/question_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home:  HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
} 

// Step 1: create the folder Structure of the application
// Step 2: create the modelfor our Quizz
// Step 3: create the list of question to display or take answer for and existing API

