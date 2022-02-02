import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/pages/searchResult/search_result_bloc.dart';
import 'package:board_game_app/resources/widgets/medium_game_card.dart';
import 'package:board_game_app/resources/widgets/menu_bottom.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    searchResultBloc.searchGamesByInput(widget.inputSearch).then((gameListResponse) {
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
      bottomNavigationBar: const MenuBottom(),
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
      return Center( child: LoadingAnimationWidget.fallingDot(
        color: Colors.blue,
        size: 100,
      ),);
    }
  }
}
