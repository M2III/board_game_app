import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/pages/game_screen.dart';
import 'package:board_game_app/services/api_service.dart';
import 'package:flutter/material.dart';

import 'mini_game_card.dart';
import 'mini_game_list_container.dart';

class MiniGameList extends StatefulWidget {
  final String _starBlockCategory;

  const MiniGameList(this._starBlockCategory, {Key? key}) : super(key: key);

  @override
  _MiniGameListState createState() => _MiniGameListState();
}

class _MiniGameListState extends State<MiniGameList> {
  AllResponseGames _games = AllResponseGames();
  int _index = 0;

  @override
  void initState() {
    if (widget._starBlockCategory == MiniGameListContainer.bestRated) {
      ApiService.getGamesOrderByRank().then((response) {
        setState(() {
          _games = response;
        });
      });
    } else {
      ApiService.getPopularKickstartersOrderByTrendingRank().then((response) {
        setState(() {
          _games = response;
        });
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (_games.results!.isNotEmpty || _games.results == null)
        ? Center(
            child: SizedBox(
              height: 180, // card height
              child: PageView.builder(
                itemCount: _games.results!.length,
                controller: PageController(viewportFraction: 0.7),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) =>
                                  GameScreen(game: _games.results![i])),
                        );
                      },
                      child: MiniGameCard(_games.results![i]),
                    ),
                  );
                },
              ),
            ),
          )
        : Container();
  }
}
