import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';
import 'package:flutter/cupertino.dart';

class DetailGameBloc {
  final _repository = GameRepository();


  Collections? showGameDetails(String input)  {
    var collection = _repository.getCollection(input);
    return collection;
  }

  Future<void> setWished(String idGame,bool wished)  async {
     await _repository.wishGame(idGame, wished);
     debugPrint(_repository.getCollection("username")!.idGame +" mon wish "
         + _repository.getCollection("username")!.wish.toString());
  }

  Future<void> setPlayed(String idGame,bool played) async {
    await _repository.playedGame(idGame, played);
    debugPrint("mon played "+ _repository.getCollection("username")!.played.toString());
  }

  Future<void> setOwned(String idGame,bool owned) async {
    await _repository.ownedGame(idGame, owned);
    debugPrint("mon owned "+ _repository.getCollection("username")!.owned.toString());
  }

}

final detailGameBloc = DetailGameBloc();