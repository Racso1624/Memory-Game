import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget{
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // body is the majority of the screen.
      body: Container(
        alignment: Alignment(0.5, -0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome To The Memory Game',
              style: TextStyle(
                fontSize: 50,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(onPressed: (){}, child: Text('HOLA'),),
          ]
        ),
      ),
    );
  }
}