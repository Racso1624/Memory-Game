import 'package:flutter/material.dart';
import 'package:memory_game/game_page.dart';

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
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment(0, 0.2),
                child: 
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => GamePage()));
                    }, 
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.cyan[600]),
                    ), 
                    child: Text(
                      'Start Game',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
              )
            ]
          ),
      ),
      backgroundColor: Colors.black,
    );
  }
}