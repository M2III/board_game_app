import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';

class CollectionsBloc {
  final _repository = GameRepository();

  Collections? showGameDetails(String input) {
    return _repository.getCollection(input);
  }

  List<Collections>? getAllCollection() {
    return _repository.getAll();
  }

  Future<void>? deleteCollections(key) {
    return _repository.deleteACollection(key);
  }

  Future<AllResponseGames> getDetailCollectionGame(String idGame) async {
    return await _repository.getDetailGame(idGame);
  }
}

final collectionsBloc = CollectionsBloc();
