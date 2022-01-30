import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';

class CollectionsBloc {
  final _repository = GameRepository();

  Collections? showGameDetails(String input)  {
    var collection = _repository.getCollection(input);
    return collection;
  }

  List<Collections>? getAllCollection() {
    return _repository.getAll();
  }

  Future<void>? deleteCollections(key) {
    return _repository.deleteACollection(key);
  }

  Future<AllResponseGames> getDetailCollectionGame(String idGame)  {
    var game =  _repository.getDetailGame(idGame);
    return game;
  }
}

final collectionsBloc = CollectionsBloc();