import 'package:board_game_app/data/models/game.dart';
import 'package:flutter/material.dart';

class MiniGameCard extends StatelessWidget {
  final Game _game;

  const MiniGameCard(this._game, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 150,
        width: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              _game.imageUrl!,
              height: 100,
              width: 100,
              fit: BoxFit.fill,
            ),
            Flexible(
              child: Text(_game.name ?? ""),
            ),
          ],
        ),
      ),
    );
  }
}
