import 'package:board_game_app/data/models/game.dart';
import 'package:board_game_app/resources/utils/text_constants.dart';
import 'package:board_game_app/resources/widgets/menu_bottom.dart';
import 'package:board_game_app/resources/widgets/to_html.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'details_game_bloc.dart';

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
          backgroundColor: const Color(0xFF6200EE),
          title: Text(
            widget.game.name!,
          ),
          centerTitle: true,
          actions: _actionOnTheCollection()
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
          detailGameBloc.setRate(widget.game.id!, rating);
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

  List<Widget>  _actionOnTheCollection() {
    return <Widget>[
      PopupMenuButton(
          onSelected: (value) {
            _updateCollection(value);
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Icon(((detailGameBloc.showGameDetails("username")?.wish==null||detailGameBloc.showGameDetails("username")?.wish==false)?Icons.favorite_border_outlined:Icons.favorite),
                      semanticLabel: "Wished", color: Colors.blueGrey),
                  const Text('Wished'),
                ],
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(((detailGameBloc.showGameDetails("username")?.played==null||detailGameBloc.showGameDetails("username")?.played==false)?Icons.casino_outlined:Icons.casino_rounded),
                      semanticLabel: "Played", color: Colors.blueGrey),
                  const Text('Played'),
                ],
              ),
              value: 2,
            ),
            PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  <Widget>[
                  Icon(((detailGameBloc.showGameDetails("username")?.owned==null||detailGameBloc.showGameDetails("username")?.owned==false)?Icons.view_column_outlined:Icons.view_column),
                      semanticLabel: "Owned", color: Colors.blueGrey),
                  const Text('Owned'),
                ],
              ),
              value: 3,
            ),
          ])
    ];
  }
  subUpdateCollection(value){
    if(value==null){
      return true;
    }else{
      return !value;
    }
  }
  _updateCollection(value) {
    switch (value) {
      case 1:
        //debugPrint(detailGameBloc.showGameDetails("username")!.wish.toString());
        detailGameBloc.setWished(widget.game.id!, subUpdateCollection(detailGameBloc.showGameDetails("username")?.wish));
        break;
      case 2:
      //debugPrint(detailGameBloc.showGameDetails("username")!.owned.toString());
        detailGameBloc.setPlayed(widget.game.id!, subUpdateCollection(detailGameBloc.showGameDetails("username")?.played));
        break;
      case 3:
        detailGameBloc.setOwned(widget.game.id!, subUpdateCollection(detailGameBloc.showGameDetails("username")?.owned));
        break;
      default://revoir cette partie et mettre ce qui est à case 3 dans default et supprimer le case 3
        break;
    }
  }
}
