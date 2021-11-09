import 'dart:convert';

import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/utils/text_constants.dart';
import 'package:http/http.dart' as http;

class GameRepository{
  static final GameRepository _singleton=
      GameRepository._internal();
  factory GameRepository()=> _singleton;

  GameRepository._internal();


  Future<AllResponseGames> getGamesOrderByRank() async {
    var uri = Uri.parse(
        'https://api.boardgameatlas.com/api/search?order_by=rank&limit=10&client_id=${TextConstants.clientId}');
    var responseFromApi = await http.get(uri);
    var formattedResponse = responseFromApi.body.replaceAll('�', '');
    var games = AllResponseGames.fromJson(jsonDecode(formattedResponse));
    return games;
  }
}