import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';


class WishlistsBloc {
  final _repository = GameRepository();

  Collections? showGameDetails(String input)  {
    var collection = _repository.getCollection(input);
    return collection;
  }

  List<Collections>? getAllCollection() {
    final _collections = _repository.getAll();
    List<Collections> temp =[];
    for(var i=0; i < _collections!.length; i++){
      if(_collections.elementAt(i).wish){
        temp.add(_collections.elementAt(i))  ;
      }
    }

    return temp;
  }

  Future<void>? deleteCollections(key) {
    return _repository.deleteACollection(key);
  }

  Future<AllResponseGames> getDetailWishListGame(String idGame)  {
    var game =  _repository.getDetailGame(idGame);
    return game;
  }

}
final wishlistsBloc = WishlistsBloc();
