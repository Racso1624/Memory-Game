import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      theme: ThemeData(textTheme: GoogleFonts.robotoMonoTextTheme()),
      debugShowCheckedModeBanner: false,
      home: LandingPage(),
    );
  }
}