import 'package:board_game_app/models/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameCardMedium extends StatelessWidget {
  const GameCardMedium({Key? key, required this.game }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Card(
        child:  Container(
          child:  Row(
              children: <Widget>[
                Image.network(
                  game.imageUrl!,
                  height: 100,
                ),
                Text(
                  game.name!,
                  textAlign: TextAlign.right,),
                ],
          ),
        ),
    );
  }
}
