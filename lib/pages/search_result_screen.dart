import 'package:board_game_app/models/all_response_games.dart';
import 'package:board_game_app/services/api_service.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  final String inputSearch;

  const SearchResultScreen({Key? key, required this.inputSearch})
      : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late AllResponseGames _games;

  @override
  void initState() {
    ApiService.searchGamesByInput(widget.inputSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search results'),
      ),
      body: _getBody(),
    );
  }

  Widget _getBody() {
    if (_games.isNotEmpty) {
      return Expanded(
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemCount: _games.length,
          itemBuilder: (context, index) {
            return MediumGameCard(game: _games[index]);
          },
        ),
      );
    } else {
      //getGames();
      return Center(
        child: Text(message,
            style: const TextStyle(
                color: Colors.amber,
                fontSize: 20.0,
                fontWeight: FontWeight.w900)),
      );
    }
  }
}
