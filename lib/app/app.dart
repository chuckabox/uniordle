import 'package:flutter/material.dart';
import 'package:flutter_wordle/app/home_screen.dart';
import 'package:flutter_wordle/wordle/views/wordle_screen.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Uniordle',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: Colors.black),
      home: HomeScreen(),
    );
  }
}