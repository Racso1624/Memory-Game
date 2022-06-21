import 'dart:io';
import 'dart:math';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget{
  @override
  State<GamePage> createState() => _GamePageState();
}

int countItems(List<dynamic> list, int element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  int count = 0;
  for (int i = 0; i < list.length; i++) {
    if (list[i][1] == element) {
      count++;
    }
  }

  return count;
}

const linksList = ["images/covers/igor.jpg", "images/covers/flowerboy.jpg","images/covers/afterhours.jpg", "images/covers/blonde.jpg",
"images/covers/dawnfm.jpg", "images/covers/starboy.jpg","images/covers/cmiygl.png", "images/covers/astroworld.webp"];
const coverCard = "images/icon/vinyl.jpg";



class _GamePageState extends State<GamePage>{

  var imagesList = [];
  var score = 0;
  var tries = 0;
  var selectedCard = [];
  var cardsFound = [];
  
  @override
  void initState() {
    gameInit();
  }

  void gameInit(){
    score = 0;
    tries = 0;
    selectedCard = [];
    cardsFound = [];
    imagesList = [];
    imagesInit();
  }

  void updateImage(index, id){
    if(imagesList[index][0] != linksList[id]){
      imagesList[index][0] = linksList[id];
    }
    else{
      imagesList[index][0] = "images/icon/vinyl.jpg";
    }
  }

  void imagesInit(){

    Random random = Random();
    
    while(imagesList.length != 16){
      final randomNumber = random.nextInt(8);
      if(countItems(imagesList, randomNumber) != 2){
        imagesList.add([coverCard, randomNumber]);
      }
    }
  }
  
  Future<void> gameFunction(index, cardId){
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if(selectedCard.length == 0){
        selectedCard.add(index);
        selectedCard.add(cardId);
        }
        else{
          if(selectedCard[1] == cardId && selectedCard[0] != index){
            cardsFound.add(selectedCard[1]);
            selectedCard = [];
            score++;
          }
          else{
            updateImage(index, cardId);
            updateImage(selectedCard[0], selectedCard[1]);
            selectedCard = [];
            tries++;
          }
        }

        if(score == 8){
          showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
          );
        }
      });
    });
  }

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
            height: 20,
          ),
          Wrap(
            spacing: 25,
            children: [
              Text(
                "Score: $score",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
              Text(
                "Tries: $tries",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              children: List.generate(imagesList.length, (index) {
                final image = imagesList[index][0];
                final cardId = imagesList[index][1];
                return Card(
                  child: InkWell(
                    child: Container(
                      child: Image.asset(image),
                    ),
                    onTap: () {
                      if(!cardsFound.contains(cardId)){
                        setState(() {
                          updateImage(index, cardId);
                          gameFunction(index, cardId);
                        });
                      }
                    },
                  )
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

Widget _buildPopupDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text(
      'Felicidades, Has Ganado', 
      textAlign: TextAlign.center, 
      style: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.cyan[600],
    actions: <Widget>[
      new Align(
        child: TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Jugar de Nuevo',
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ),
      )
    ],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
  );
}