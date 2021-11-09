import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/providers/remote/game_api_provider.dart';

class GameRepository {
  static final GameRepository _singleton = GameRepository._internal();
  factory GameRepository() => _singleton;

  GameRepository._internal();

  Future<AllResponseGames> getGamesOrderByRank() {
    return GameApiProvider().getGamesOrderByRank();
  }

  Future<AllResponseGames> getPopularKickstartersOrderByTrendingRank() {
    return GameApiProvider().getPopularKickstartersOrderByTrendingRank();
  }

  Future<AllResponseGames> searchGamesByInput(String input) {
    return GameApiProvider().searchGamesByInput(input);
  }
}