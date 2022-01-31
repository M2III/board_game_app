import 'dart:convert';

import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/resources/utils/text_constants.dart';
import 'package:http/http.dart' as http;

class GameApiProvider {
  static final GameApiProvider _singleton = GameApiProvider._internal();

  factory GameApiProvider() => _singleton;
  GameApiProvider._internal();

  Future<AllResponseGames> getGamesOrderByRank() async {
    var uri = Uri.parse(
        'https://api.boardgameatlas.com/api/search?order_by=rank&limit=10&client_id=${TextConstants.clientId}');
    var responseFromApi = await http.get(uri);
    var formattedResponse = responseFromApi.body.replaceAll('�', '');
    var games = AllResponseGames.fromJson(jsonDecode(formattedResponse));
    return games;
  }

  //CollectionHiveProvider?_collectionHiveProvider;

  Future<AllResponseGames> getPopularKickstartersOrderByTrendingRank() async {
    var uri = Uri.parse(
        'https://api.boardgameatlas.com/api/search?kickstarter=true&limit=10&client_id=${TextConstants.clientId}&order_by=trending_rank');
    var responseFromApi = await http.get(uri);
    var formattedResponse = responseFromApi.body.replaceAll('�', '');
    var games = AllResponseGames.fromJson(jsonDecode(formattedResponse));
    return games;
  }

  Future<AllResponseGames> searchGamesByInput(String input) async {
    var endpointUrl = 'https://api.boardgameatlas.com/api/search';
    Map<String, String> queryParams = {
      'name': input,
      'pretty': 'true',
      'exact': 'true',
      'client_id': TextConstants.clientId
    };
    String queryString = Uri(queryParameters: queryParams).query;
    var uri = Uri.parse(
        '$endpointUrl?$queryString'); // result - https://api.boardgameatlas.com/api/search?name=Catan&pretty=true&exact=true&client_id=JLBr5npPhV
    var responseFromApi = await http.get(uri);
    var formattedResponse = responseFromApi.body.replaceAll('�', '');
    var games = AllResponseGames.fromJson(jsonDecode(formattedResponse));
    return games;
  }

  Future<AllResponseGames> getGame(String input) async {
    var uri = Uri.parse(
        'https://api.boardgameatlas.com/api/search?ids=$input&client_id=${TextConstants.clientId}');
    var responseFromApi = await http.get(uri);
    var formattedResponse = responseFromApi.body.replaceAll('�', '');
    var games = AllResponseGames.fromJson(jsonDecode(formattedResponse));
    return games;
    // example result -/https://api.boardgameatlas.com/api/search?ids=yqR4PtpO8X&client_id=JLBr5npPhV

  }
}
