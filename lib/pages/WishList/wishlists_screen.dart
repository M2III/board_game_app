import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/models/game.dart';
import 'package:board_game_app/pages/collections_screen.dart';
import 'package:board_game_app/resources/utils/text_constants.dart';
import 'package:board_game_app/resources/widgets/collections_list.dart';
import 'package:board_game_app/resources/widgets/medium_game_card.dart';
import 'package:board_game_app/resources/widgets/menu_bottom.dart';
import 'package:board_game_app/resources/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swipeable_tile/swipeable_tile.dart';
import 'wishlists_bloc.dart';

class WishlistsScreen extends StatefulWidget {
  const WishlistsScreen({
    Key? key,
  }) : super(key: key);

  @override
  _WishlistsScreenState createState() => _WishlistsScreenState();
}

class _WishlistsScreenState extends State<WishlistsScreen> {
  final TextEditingController _textController = TextEditingController();
  final _collections = wishlistsBloc.getAllCollection();
  var _filteredList = <Collections>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your boardgames collection'),
      ),
      bottomNavigationBar: const MenuBottom(),
      body: SingleChildScrollView(child: _getBody()),
    );
  }

  Widget _getBody() {
    if (wishlistsBloc.getAllCollection()!.isNotEmpty) {
      return Column(children: <Widget>[
        TextField(
          controller: _textController,
          decoration: InputDecoration(
            hintText: "Search a game...",
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            labelStyle: const TextStyle(
                color: Color.fromARGB(174, 182, 191, 1),
                fontSize: 15,
                fontStyle: FontStyle.normal),
            filled: true,
            fillColor: const Color.fromRGBO(255, 255, 255, 1),
            prefixIcon: const Icon(Icons.search),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              _filteredList = wishlistsBloc
                  .getAllCollection()!
                  .where((element) =>
                      element.nameGame.toLowerCase().contains(text))
                  .cast<Collections>()
                  .toList();
            });
          },
        ),
        //if (_filteredList.isEmpty && _textController.text.isEmpty)
        if (_filteredList.isNotEmpty && _textController.text.isNotEmpty)
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            children: _filteredList
                .map(
                  (Collections collection) => SwipeableTile(
                      color: Colors.white,
                      swipeThreshold: 0.2,
                      direction: SwipeDirection.endToStart,
                      isEelevated: false,
                      borderRadius: 0,
                      onSwiped: (_) {
                        final index = _collections!.indexOf(collection);
                        setState(() {
                          _collections!.removeAt(index);
                          wishlistsBloc.deleteCollections(collection.idGame);
                        });
                      },
                      backgroundBuilder: (
                        _,
                        SwipeDirection direction,
                        AnimationController progress,
                      ) {
                        if (direction == SwipeDirection.endToStart) {
                          return Container(
                              color: progress.value > 0.0
                                  ? const Color(0xFFed7474)
                                  : Colors.white,
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.delete,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                  ]));
                        }
                        return Container(
                          color: Colors.white,
                        );
                      },
                      key: UniqueKey(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            width: 700,
                            height: 100,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                Image.network(collection.imageUrl.isNotEmpty
                                    ? collection.imageUrl
                                    : TextConstants.infoNotAvailable),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(collection.nameGame.isNotEmpty
                                          ? collection.nameGame
                                          : TextConstants.infoNotAvailable),
                                      _getNumberPlayer(collection),
                                    ],
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(collection.rate != null
                                          ? collection.rate.toString()
                                          : TextConstants.infoNotAvailable),
                                      Text(collection.played
                                          ? TextConstants.alreadyPlayed
                                          : TextConstants.neverPlayed),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                )
                .toList(),
          )
        else
          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 1.0),
            children: wishlistsBloc
                .getAllCollection()!
                .map(
                  (Collections collection) => SwipeableTile(
                      color: Colors.white,
                      swipeThreshold: 0.2,
                      direction: SwipeDirection.endToStart,
                      isEelevated: false,
                      borderRadius: 0,
                      onSwiped: (_) {
                        final index = _collections!.indexOf(collection);
                        setState(() {
                          _collections!.removeAt(index);
                          wishlistsBloc.deleteCollections(collection.idGame);
                        });
                      },
                      backgroundBuilder: (
                        _,
                        SwipeDirection direction,
                        AnimationController progress,
                      ) {
                        if (direction == SwipeDirection.endToStart) {
                          return Container(
                              color: progress.value > 0.0
                                  ? const Color(0xFFed7474)
                                  : Colors.white,
                              padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const <Widget>[
                                    Icon(
                                      Icons.delete,
                                      size: 24,
                                      color: Colors.white,
                                    ),
                                  ]));
                        }
                        return Container(
                          color: Colors.white,
                        );
                      },
                      key: UniqueKey(),
                      child: collection.wish
                          ? Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                              child: Card(
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  width: 700,
                                  height: 100,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                          child: Image.network(
                                              collection.imageUrl.isNotEmpty
                                                  ? collection.imageUrl
                                                  : TextConstants
                                                      .infoNotAvailable)),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(collection.nameGame.isNotEmpty
                                                ? collection.nameGame
                                                : TextConstants
                                                    .infoNotAvailable),
                                            _getNumberPlayer(collection),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(collection.rate != null
                                                ? collection.rate.toString()
                                                : TextConstants
                                                    .infoNotAvailable),
                                            Text(collection.played
                                                ? TextConstants.alreadyPlayed
                                                : TextConstants.neverPlayed),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const Expanded(
                              child: Text('No results'),
                            )),
                )
                .toList(),
          )
      ]);
    } else {
      return const Center(
        child: Text("No results",
            style: TextStyle(
                color: Colors.amber,
                fontSize: 20.0,
                fontWeight: FontWeight.w900)),
      );
    }
  }

  Widget _getNumberPlayer(Collections collection) {
    if (collection.idGame.isNotEmpty) {
      return Text(collection.minPlayers.toString() +
          " - " +
          collection.maxPlayers.toString() +
          " players");
    } else {
      return const Text("Information non disponible");
    }
  }
}
