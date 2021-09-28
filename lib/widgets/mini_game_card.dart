import 'package:flutter/material.dart';
import '../models/game.dart';

class MiniGameCard extends StatelessWidget {
  Game _game;

  MiniGameCard(this._game);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Row(
          children: [
            Image.network(_game.thumbUrl ?? ""),
            Text(_game.name ?? ""),
          ],
        ),
      ),
    );
  }
}
