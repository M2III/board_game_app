import 'package:flutter/material.dart';
import '../models/game.dart';

class MiniGameCard extends StatelessWidget {
  final Game _game;

  MiniGameCard(this._game);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 250,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
    );
  }
}
