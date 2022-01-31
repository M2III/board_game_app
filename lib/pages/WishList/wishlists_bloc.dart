import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';

class WishlistsBloc {
  final _repository = GameRepository();

  Collections? showGameDetails(String input) {
    return _repository.getCollection(input);
  }

  List<Collections>? getAllCollection() {
    return _repository.getAll()!.where((element) => element.wish).toList();
  }

  Future<void>? deleteCollections(key) {
    return _repository.deleteACollection(key);
  }

  Future<AllResponseGames> getDetailWishListGame(String idGame) {
    return _repository.getDetailGame(idGame);
  }
}

final wishlistsBloc = WishlistsBloc();
