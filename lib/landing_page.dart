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
        child:
          Stack(
            children: [
              Align(
                alignment: Alignment(0.5, -0.4),
                child: 
                  Text(
                    'Welcome To The Memory Game',
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.green,
                    ),
                    textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment(0, 0.2),
                child: 
                  ElevatedButton(
                    onPressed: (){}, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green[800]),
                    ), 
                    child: Text('Start Game'),
                  ),
              )
            ]
          ),
      ),
    );
  }
}