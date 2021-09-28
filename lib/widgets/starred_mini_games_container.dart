import '../models/game.dart';
import 'package:flutter/material.dart';
import '../widgets/mini_game_list.dart';

class StarredMiniGamesContainer extends StatelessWidget {
  String _starBlockCategory;
  List<Game> _games;

  // Available starred categories
  static const String bestRated = "Best games";
  static const String bestSells = "Best sells";

  StarredMiniGamesContainer(this._starBlockCategory, this._games);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(_starBlockCategory),
          MiniGameList(_games),
        ],
      ),
    );
  }
}
