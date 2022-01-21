import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';
import 'package:flutter/cupertino.dart';

class MiniGameListBloc {
  final _gameRepository = GameRepository();

  Future<AllResponseGames> getPopularKickstartersOrderByTrendingRank()  async {
    return await _gameRepository.getPopularKickstartersOrderByTrendingRank();
  }

  Future<AllResponseGames> getGamesOrderByRank() {
    return _gameRepository.getGamesOrderByRank();
  }
}

final miniGameListBloc = MiniGameListBloc();
