
import 'dart:convert';
import 'dart:ffi';

import 'package:board_game_app/models/all_response_games.dart';
import 'package:board_game_app/models/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class  ApiSearch extends StatefulWidget {
  const ApiSearch({Key? key, required this.game_name}) : super(key: key);

  final String game_name;

  @override
  _ApiSearchState createState() => _ApiSearchState();

}

class _ApiSearchState extends State<ApiSearch> {

  String _response = 'Vide';
  late All_response_games? _allGame;
  List<Game> _games = [];

  Future<void> getGames() async{

    var endpointUrl = 'https://api.boardgameatlas.com/api/search';
    Map<String, String> queryParams = {
      'name': widget.game_name,
      'pretty': 'true',
      'client_id' : 'JLBr5npPhV'
    };

    String queryString = Uri(queryParameters: queryParams).query;

    var uri = Uri.parse(endpointUrl + '?' + queryString); // result - https://api.boardgameatlas.com/api/search?name=Catan&pretty=true&client_id=JLBr5npPhV
    var responseFromApi = await http.get(uri);
    debugPrint(responseFromApi.body);
    setState(() {
      _response = responseFromApi.body;
      All_response_games resp = All_response_games.fromJson(jsonDecode(_response));
      _games = resp.results!;
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    );
  }


  }

