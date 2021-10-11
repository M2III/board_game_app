
import 'dart:convert';

import 'package:board_game_app/models/all_response_games.dart';
import 'package:board_game_app/models/game.dart';
import 'package:board_game_app/widgets/gameCardMedium.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class  ApiSearch extends StatefulWidget {
  const ApiSearch({Key? key, required this.gameName}) : super(key: key);

  final String gameName;

  @override
  _ApiSearchState createState() => _ApiSearchState();

}

class _ApiSearchState extends State<ApiSearch> {

  String _response = 'Vide';
  List<Game> _games = [];

  Future<void> getGames() async{

    var endpointUrl = 'https://api.boardgameatlas.com/api/search';
    Map<String, String> queryParams = {
      'name': widget.gameName,
      'pretty': 'true',
      'exact' : 'true',
      'client_id' : 'JLBr5npPhV'
    };

    String queryString = Uri(queryParameters: queryParams).query;

    var uri = Uri.parse(endpointUrl + '?' + queryString); // result - https://api.boardgameatlas.com/api/search?name=Catan&pretty=true&exact=true&client_id=JLBr5npPhV
    var responseFromApi = await http.get(uri);
    if(responseFromApi.statusCode == 200){

      setState(() {
        _response = responseFromApi.body.replaceAll('�', '');
        AllResponseGames resp = AllResponseGames.fromJson(jsonDecode(_response));
        _games = resp.results!;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _getBody(),
    );
  }

  Widget _getBody(){
    if(_games.isNotEmpty){
      return ListView.separated(
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _games.length,
        itemBuilder: (context, index){
          return GameCardMedium(game: _games[index]);
        },
      );
    } else {
      getGames();
      return const Center(
        child : CircularProgressIndicator(),
      );
    }
  }


  }

