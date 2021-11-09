import 'package:board_game_app/data/models/game.dart';
import 'package:board_game_app/pages/game_screen.dart';
import 'package:board_game_app/resources/utils/text_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MediumGameCard extends StatelessWidget {
  const MediumGameCard({Key? key, required this.game}) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(pageBuilder: (_, __, ___) => GameScreen(game: game)),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: 700,
          height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Image.network(game.imageUrl != null
                  ? game.imageUrl!
                  : TextConstants.infoNotAvailable),
              Flexible(
                fit: FlexFit.tight,
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(game.name != null
                        ? game.name!
                        : TextConstants.infoNotAvailable),
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
                    Text(game.averageUserRating != null
                        ? game.averageUserRating!.toStringAsFixed(1)
                        : TextConstants.infoNotAvailable),
                    Text(game.yearPublished != null
                        ? game.yearPublished.toString()
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

  Widget _getNumberPlayer() {
    if (game.minPlayers != null && game.maxPlayers != null) {
      return Text(game.minPlayers.toString() +
          " - " +
          game.maxPlayers.toString() +
          " players");
    } else {
      return const Text("Information non disponible");
    }
  }
}
