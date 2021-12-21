import 'package:board_game_app/data/models/game.dart';
import 'package:board_game_app/pages/game_screen.dart';
import 'package:board_game_app/resources/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';

class DetailGameScreen extends StatefulWidget {
  final Game game;

  const DetailGameScreen({Key? key, required this.game})
      : super(key: key);

  @override
  _GameCardScreenState createState() => _GameCardScreenState();
}

class _GameCardScreenState extends State<DetailGameScreen> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return Scaffold(
        appBar: AppBar(
          title: const Text('Search results'),
        ),
        bottomNavigationBar: const MenuBottom(),
        body: _getBody(widget.game),
      );
  }

  Widget _getBody(Game game) {
    return GameScreen(game: game);
  }
}
