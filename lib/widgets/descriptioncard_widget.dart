
import 'package:board_game_app/models/game.dart';
import 'package:board_game_app/pages/collections_screen.dart';
import 'package:board_game_app/pages/product_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionCardWidget extends StatelessWidget {
  const DescriptionCardWidget({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () { Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> ProductDetail(game: game,),));},
      child: Card(

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
                    _getNumberPlayer(),

                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(game.averageUserRating != null ? game.averageUserRating!.toStringAsFixed(1): "info non disponible"),
                    Text(game.yearPublished != null ? game.yearPublished.toString() : "info non disponible"),
                  ],
                ),
              ),

            ],
          ),
        ),
      ) ,
    );

        }

  Widget _getNumberPlayer(){
    if( game.minPlayers != null && game.maxPlayers != null){
      return Text(game.minPlayers.toString() + " - " + game.maxPlayers.toString() + " players");
    }else{
      return const Text("Information non disponible");
    }
  }

}