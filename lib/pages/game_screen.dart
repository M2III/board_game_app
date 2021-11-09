import 'package:board_game_app/data/models/game.dart';
import 'package:board_game_app/utils/text_constants.dart';
import 'package:board_game_app/widgets/menu_bottom.dart';
import 'package:board_game_app/widgets/to_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GameScreen extends StatefulWidget {
  final Game game;

  const GameScreen({Key? key, required this.game}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: Text(
          widget.game.name!,
        ),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
              onSelected: (value) {
                _updateCollection(value);
              },
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Icon(Icons.favorite,
                              semanticLabel: "Wished", color: Colors.blueGrey),
                          Text('Wished'),
                        ],
                      ),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const <Widget>[
                          Icon(Icons.casino_outlined,
                              semanticLabel: "Played", color: Colors.blueGrey),
                          Text('Played'),
                        ],
                      ),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          Icon(Icons.view_column_outlined,
                              semanticLabel: "Owned", color: Colors.blueGrey),
                          Text('Owned'),
                        ],
                      ),
                      value: 3,
                    ),
                  ])
        ],
      ),
      bottomNavigationBar: const MenuBottom(),
      body: _getCard(),
      extendBody: true,
    );
  }

  Widget _getNumberPlayer() {
    if (widget.game.minPlayers != null && widget.game.maxPlayers != null) {
      return Text(widget.game.minPlayers.toString() +
          " - " +
          widget.game.maxPlayers.toString() +
          " players");
    } else {
      return const Text(TextConstants.infoNotAvailable);
    }
  }

  _getCard() {
    return Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.network(
            widget.game.imageUrl != null
                ? widget.game.imageUrl!
                : TextConstants.infoNotAvailable,
            width: 200,
            height: 200,
          ),
        ],
      ),
      RatingBar.builder(
        initialRating: 3,
        /* Pour l'initial rating on ajoutera un fetch pour recuperer la note mise par l'user */
        minRating: 0.5,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          // print(rating);
        },
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.game.name != null
                ? widget.game.name!
                : TextConstants.infoNotAvailable),
            _getNumberPlayer(),
          ],
        ),
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //html(data:widget.game.description!),
            //Text(widget.game.description!),
            Text(widget.game.averageUserRating != null
                ? widget.game.averageUserRating!.toStringAsFixed(1)
                : TextConstants.infoNotAvailable),
            Text(widget.game.yearPublished != null
                ? widget.game.yearPublished.toString()
                : TextConstants.infoNotAvailable),
          ],
        ),
      ),
      Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
            ),
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                TextConstants.gameDescription,
                style: TextStyle(color: Colors.yellow),
              ),
            ],
          )),
      Expanded(
        flex: 1,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical, //.horizontal
          child: ToHtml(html: widget.game.description!),
        ),
      ),
      /*Expanded(
        child: ToHtml(html: widget.game.description!),
      )*/
    ]);
  }

  _updateCollection(value) {
    switch (value) {
      case 1:
        // print("I wish "+widget.game.name!);
        break;
      case 2:
        // print("I played at "+widget.game.name!);
        break;
      case 3:
        // print("I owned at "+widget.game.name!);
        break;
      default:
        break;
    }
  }
}
