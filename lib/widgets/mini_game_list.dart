import 'package:board_game_app/widgets/mini_game_card.dart';
import 'package:flutter/material.dart';
import '../models/game.dart';

class MiniGameList extends StatelessWidget {
  List<Game> _games;

  MiniGameList(this._games);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _games.length,
        itemBuilder: (context, index) {
          return _games.isEmpty
              ? const Text("empty")
              : MiniGameCard(
                  _games[index],
                );
        });
  }
}
