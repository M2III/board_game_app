import 'package:board_game_app/models/all_response_games.dart';
import 'package:board_game_app/services/api_service.dart';
import 'package:board_game_app/widgets/medium_game_card.dart';
import 'package:flutter/material.dart';

class SearchResultScreen extends StatefulWidget {
  final String inputSearch;

  const SearchResultScreen({Key? key, required this.inputSearch})
      : super(key: key);

  @override
  _SearchResultScreenState createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  AllResponseGames _games = AllResponseGames();

  @override
  void initState() {
    ApiService.searchGamesByInput(widget.inputSearch).then((gameListResponse) {
      setState(() {
        _games = gameListResponse;
      });
    });

    super.initState();
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
    if (_games.results!.isNotEmpty) {
      return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _games.results!.length,
        itemBuilder: (context, index) {
          return MediumGameCard(game: _games.results![index]);
        },
      );
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
}