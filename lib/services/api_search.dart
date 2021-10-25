import 'dart:convert';

import 'package:board_game_app/models/all_response_games.dart';
import 'package:board_game_app/models/game.dart';
import 'package:board_game_app/widgets/descriptioncard_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiSearch extends StatefulWidget {
  const ApiSearch({Key? key}) : super(key: key);

  @override
  _ApiSearchState createState() => _ApiSearchState();
}

class _ApiSearchState extends State<ApiSearch> {
  String _response = 'Vide';
  List<Game> _games = [];
  String inputValue = "";
  String message = "You can seach All you need here";

  Future<void> getGames() async {
    if (inputValue.isNotEmpty) {
      var endpointUrl = 'https://api.boardgameatlas.com/api/search';
      Map<String, String> queryParams = {
        'name': inputValue,
        'pretty': 'true',
        'exact': 'true',
        'client_id': 'JLBr5npPhV'
      };

      String queryString = Uri(queryParameters: queryParams).query;

      var uri = Uri.parse(endpointUrl +
          '?' +
          queryString); // result - https://api.boardgameatlas.com/api/search?name=Catan&pretty=true&exact=true&client_id=JLBr5npPhV
      var responseFromApi = await http.get(uri);
      if (responseFromApi.statusCode == 200) {
        setState(() {
          _response = responseFromApi.body.replaceAll('�', '');
          if (json.decode(_response).toString() == "{games: [], count: 0}") {
            message = "Nothing match with your search";
          } else {
            AllResponseGames resp =
                AllResponseGames.fromJson(jsonDecode(_response));
            _games = resp.results!;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        TextField(onSubmitted: (String value) async {
          if (value.isEmpty) {
            setState(() {
              message = "Search is empty ;)";
              _games = [];
            });
          }
          setState(() {
            inputValue = value;
          });
          getGames();
        }),
        _getBody()
      ],
    ));
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
            return DescriptionCardWidget(game: _games[index]);
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
