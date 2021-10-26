import 'package:flutter/material.dart';
import '../widgets/mini_game_list.dart';

class MiniGameListContainer extends StatelessWidget {
  final String _starBlockCategory;

  // Available starred categories
  static const String bestRated = "Best 10 rated games";
  static const String bestKickstarters = "10 Popular on Kickstarter";

  const MiniGameListContainer(this._starBlockCategory, {Key? key})
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
