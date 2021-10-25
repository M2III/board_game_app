import 'dart:convert';

import 'package:board_game_app/models/all_response_games.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<AllResponseGames> getGamesOrderByRank() async {
    var uri = Uri.parse(
        'https://api.boardgameatlas.com/api/search?order_by=rank&limit=10&client_id=3q5Q7endwL');
    var responseFromApi = await http.get(uri);
    var formattedResponse = responseFromApi.body.replaceAll('�', '');
    var games = AllResponseGames.fromJson(jsonDecode(formattedResponse));
    return games;
  }

  static Future<AllResponseGames>
      getPopularKickstartersOrderByTrendingRank() async {
    var uri = Uri.parse(
        'https://api.boardgameatlas.com/api/search?kickstarter=true&limit=10&client_id=zLnRYVHtr5&order_by=trending_rank');
    var responseFromApi = await http.get(uri);
    var formatedResponse = responseFromApi.body.replaceAll('�', '');
    var games = AllResponseGames.fromJson(jsonDecode(formatedResponse));
    return games;
  }
}
