import 'dart:async';

import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';

class DetailGameBloc {
  final _repository = GameRepository();


  Collections? showGameDetails(String input)  {
    var collection = _repository.getCollection(input);
    return collection;
  }

  /*Future<void> insertACollection(String idGame,bool wished, bool played, bool owned, double rate)  async {
    await _repository.insertACollection(idGame, wished, played, owned, rate);
  }*/

  Future<void> setWished(String idGame,bool wished, double? rate)  async {
    await _repository.insertACollection(idGame,
        wished,
        _repository.getCollection(idGame)?.played??false,
        _repository.getCollection(idGame)?.owned??false,
        rate!);
  }

  Future<void> setPlayed(String idGame,bool played, double? rate) async {
    await _repository.insertACollection(idGame,
        _repository.getCollection(idGame)?.wish??false,
        played,
        _repository.getCollection(idGame)?.owned??false,
        rate!);
  }

  Future<void> setOwned(String idGame,bool owned,double rate) async {
    await _repository.insertACollection(idGame,
        _repository.getCollection(idGame)?.wish??false,
        _repository.getCollection(idGame)?.played??false,
        owned,
        rate);
  }

  Future<void> setRate(String idGame, double rate) async {
    await _repository.insertACollection(idGame,
        _repository.getCollection(idGame)?.wish??false,
        _repository.getCollection(idGame)?.played??false,
        _repository.getCollection(idGame)?.owned??false,
        rate);
  }

}

final detailGameBloc = DetailGameBloc();