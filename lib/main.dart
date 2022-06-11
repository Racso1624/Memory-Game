import 'package:flutter/material.dart';
import 'package:memory_game/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState(){
    return MyAppState();
  } 
}

class MyAppState extends State<MyApp>{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'Memory Game',
      home: LandingPage(),
    );
  }
}