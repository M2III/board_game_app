import 'package:board_game_app/models/game.dart';
import 'package:board_game_app/widgets/to_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:board_game_app/utils/constants.dart' as constants;
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
        /*Dans l'idée en fonction de si ce jeux est ou non dans la collectionon mettra ajouter ou supprimer ;)  */
        FloatingActionButton(
          backgroundColor: const Color(0xFF6200EE),
          onPressed: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Game Add to your collection'),
              content: const Text(
                  'You can cancel the addition by clicking on cancel otherwise click on ok'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => {
                    Navigator.pop(context, 'Cancel'),
                    print("cancel"),
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => {
                    Navigator.pop(context, 'OK'),
                    print("Ok"),
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
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
      return const Text(constants.infoNotAvailable);
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
                : constants.infoNotAvailable,
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
          print(rating);
        },
      ),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.game.name != null
                ? widget.game.name!
                : constants.infoNotAvailable),
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
                : constants.infoNotAvailable),
            Text(widget.game.yearPublished != null
                ? widget.game.yearPublished.toString()
                : constants.infoNotAvailable),
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
                constants.gameDescription,
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
}
