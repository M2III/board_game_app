import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';

class DetailGameBloc {
  final _repository = GameRepository();

  Collections? showGameDetails(String input)  {
    var game = _repository.get(input);

    return game;
  }
}

final detailGameBloc = DetailGameBloc();