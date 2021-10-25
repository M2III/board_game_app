import 'package:flutter/material.dart';
import '../widgets/mini_game_list.dart';

class StarredMiniGamesContainer extends StatelessWidget {
  final String _starBlockCategory;

  // Available starred categories
  static const String bestRated = "Best rated games";
  static const String bestKickstarters = "Popular on Kickstarter";

  const StarredMiniGamesContainer(this._starBlockCategory, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(_starBlockCategory),
        MiniGameList(_starBlockCategory),
      ],
    );
  }
}
