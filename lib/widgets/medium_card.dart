import 'package:board_game_app/models/game.dart';
import 'package:board_game_app/widgets/to_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class MediumCard extends StatefulWidget {
  final Game game;

  const MediumCard({Key? key, required this.game}) : super(key: key);

  @override
  _MediumCardState createState() => _MediumCardState();
}

class _MediumCardState extends State<MediumCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        title: Text(
          widget.game.name!,
        ),
        centerTitle: true,
      ),
      body: _getCard(),
      extendBody: true,
      persistentFooterButtons: [
        FloatingActionButton(
          backgroundColor: const Color(0xFF6200EE),
          onPressed: () => print("toto"),
          child: const Icon(
            Icons.add,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _getNumberPlayer() {
    if (widget.game.minPlayers != null && widget.game.maxPlayers != null) {
      return Text(widget.game.minPlayers.toString() +
          " - " +
          widget.game.maxPlayers.toString() +
          " players");
    } else {
      return const Text("Information non disponible");
    }
  }

  _getCard() {
    return Column(mainAxisSize: MainAxisSize.max, children:  <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Image.network(
            widget.game.imageUrl != null
                ? widget.game.imageUrl!
                : "image non disponible",
            width: 200,
            height: 200,
          ),
        ],
      ),
      RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {
          print(rating);
        },
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.game.name != null
                ? widget.game.name!
                : "info non disponible"),
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
                : "info non disponible"),
            Text(widget.game.yearPublished != null
                ? widget.game.yearPublished.toString()
                : "info non disponible"),
          ],
        ),
      ),
    Expanded(
    flex: 1,
    child:  SingleChildScrollView(
    scrollDirection: Axis.vertical,//.horizontal
    child:
    ToHtml(html: widget.game.description!),
    ),),
      /*Expanded(
        child: ToHtml(html: widget.game.description!),
      )*/
    ]);
  }
}
