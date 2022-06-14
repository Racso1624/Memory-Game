import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}

int countItems(List<dynamic> list, String element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i][0] == element) {
      count++;
    }
  }

  return count;
}

List<dynamic> mixList(links){
  Random random = Random();
  var cardsList = [];

  while (cardsList.length != 16) {
    final randomNumber = random.nextInt(8);
    final item = links[randomNumber];
    if(countItems(cardsList, item) != 2){
      cardsList.add([item, randomNumber]);
    }
  }

  return cardsList;
}

class _GamePageState extends State<GamePage>{

  static const linksList = ["images/covers/igor.jpg", "images/covers/flowerboy.jpg","images/covers/afterhours.jpg", "images/covers/blonde.jpg",
  "images/covers/dawnfm.jpg", "images/covers/starboy.jpg","images/covers/cmiygl.png", "images/covers/astroworld.webp"];
  
  var cardsList = mixList(linksList);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Text(
              'Let\'s Play The Game',
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              children: List.generate(cardsList.length, (index) {
                final image = cardsList[index][0];
                final cardId = cardsList[index][1];
                return FlipCard(
                  front: Image.asset("images/icon/vinyl.jpg"),
                  back: Image.asset(image),
                );
              }),
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

// child:
//           Stack(
//             children: [
//               Align(
//                 alignment: Alignment(0.5, -0.8),
//                 child: 
//                   Text(
//                     'Let\'s Play The Game',
//                     style: TextStyle(
//                       fontSize: 40,
//                       color: Colors.white,
//                     ),
//                     textAlign: TextAlign.center,
//                 ),
//               ),
//             ]
//           ),