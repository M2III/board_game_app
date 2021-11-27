import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';

class MiniGameListBloc {
  final _gameRepository = GameRepository();

  Future<AllResponseGames> getPopularKickstartersOrderByTrendingRank()  {
     _gameRepository.insertATest();
    return _gameRepository.getPopularKickstartersOrderByTrendingRank();
  }

  Future<AllResponseGames> getGamesOrderByRank() {
    return _gameRepository.getGamesOrderByRank();
  }
}

final miniGameListBloc = MiniGameListBloc();
