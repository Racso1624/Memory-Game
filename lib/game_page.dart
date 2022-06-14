import 'dart:math';
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
    if (list[i] == element) {
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
      cardsList.add(item);
    }
  }

  return cardsList;
}

class _GamePageState extends State<GamePage>{

  static const linksList = ["https://jenesaispop.com/wp-content/uploads/2019/05/tyler-the-creator_IGOR-768x768.jpg", "https://indiehoy.com/wp-content/uploads/2017/07/Tyler-the-Creator-Flower-Boy-1200x1207.jpg",
  "https://m.media-amazon.com/images/I/A1tJHOT7TqL._SL1500_.jpg", "https://indierocks.b-cdn.net/wp-content/uploads/2021/08/Frank-Ocean_Blonde_portada.jpg",
  "https://indiehoy.com/wp-content/uploads/2022/02/the-weeknd-dawn-fm.jpg", "https://imagenes.elpais.com/resizer/yORYQcksvhLeBbO2cVDrU5fYgI8=/1200x0/arc-anglerfish-eu-central-1-prod-prisa.s3.amazonaws.com/public/47UE7RAL55552LGOYYT7BR7GI4.jpg",
  "https://indiehoy.com/wp-content/uploads/2021/08/tyler-the-creator-call-me-if-you-get-lost.jpg", "https://indiehoy.com/wp-content/uploads/2018/08/travis-scott-astroworld-1200x1200.jpg"];
  
  var cardsList = mixList(linksList);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        child: 
          Stack(
            children: [
              GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                children: List.generate(cardsList.length, (index) {
                  final image = cardsList[index];
                  return Card(
                    child: Container(
                      child: Image.network(image),
                    ),
                  );
                }),
              ),
            ],
          )
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