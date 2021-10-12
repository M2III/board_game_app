
import 'package:board_game_app/models/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionCardWidget extends StatelessWidget {
  const DescriptionCardWidget({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return  Card(
        child:  Container(
          padding: const EdgeInsets.all(10.0),
          width: 700,
          height: 100,
          child:  Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.network(game.imageUrl != null ? game.imageUrl! : "image non disponible"),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                    Text(game.name != null ? game.name! : "info non disponible"),
                    Text(game.publisher != null ? game.publisher! : "info non disponible"),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(game.averageUserRating != null ? game.averageUserRating.toString() : "info non disponible"),
                    Text(game.yearPublished != null ? game.yearPublished.toString() : "info non disponible"),
                  ],
                ),
              ),

            ],
          ),
        ),
      );


  }}