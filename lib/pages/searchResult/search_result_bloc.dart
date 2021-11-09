import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';

class SearchResultBloc {
  final _repository = GameRepository();


  Future<AllResponseGames>  searchGamesByInput(String input) async {
    var games = await _repository.searchGamesByInput(input);

    return games;
  }
}

final searchResultBloc = SearchResultBloc();