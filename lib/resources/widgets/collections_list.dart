import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/models/game.dart';
import 'package:board_game_app/pages/DetailGame/details_game_screen.dart';
import 'package:board_game_app/resources/utils/text_constants.dart';
import 'package:flutter/material.dart';

class CollectionList extends StatelessWidget {
  const CollectionList({Key? key, required this.collections}) : super(key: key);

  final Collections collections;

  @override
  Widget build(BuildContext context) {
    return InkWell(

      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: 700,
          height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              /*Image.network(game.imageUrl != null
                  ? game.imageUrl!
                  : TextConstants.infoNotAvailable),*/
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(collections.idGame != null
                        ? collections.idGame.toString()
                        : TextConstants.infoNotAvailable),
                   // _getNumberPlayer(),
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(collections.rate != null
                        ? collections.rate!.toStringAsFixed(1)
                        : TextConstants.infoNotAvailable),
                    Text(collections.rate != null
                        ? collections.rate.toString()
                        : TextConstants.infoNotAvailable),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*Widget _getNumberPlayer() {
    if (game.minPlayers != null && game.maxPlayers != null) {
      return Text(game.minPlayers.toString() +
          " - " +
          game.maxPlayers.toString() +
          " players");
    } else {
      return const Text("Information non disponible");
    }
  }*/
}
