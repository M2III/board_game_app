import 'dart:async';

import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';
import 'package:flutter/cupertino.dart';

class DetailGameBloc {
  final _repository = GameRepository();


  Collections? showGameDetails(String input)  {
    var collection = _repository.getCollection(input);
    return collection;
  }
/*
  Future<void> insertACollection(String idGame,bool wished, bool played, bool owned, double rate)  async {
    debugPrint("Avant owned"+_repository.getCollection("username")!.owned.toString());
    debugPrint("Avant played"+_repository.getCollection("username")!.played.toString());
    debugPrint("Avant wish"+_repository.getCollection("username")!.wish.toString());
    await _repository.insertACollection(idGame, wished, played, owned, rate);
    debugPrint(_repository.getCollection("username")!.idGame +" mon wish "
        + _repository.getCollection("username")!.wish.toString());
    debugPrint('dans aciton wish');
    debugPrint("Apres owned"+_repository.getCollection("username")!.owned.toString());
    debugPrint("Apres played"+_repository.getCollection("username")!.played.toString());
    debugPrint("Apres wish"+_repository.getCollection("username")!.wish.toString());
  }*/

  Future<void> setWished(String idGame,bool wished)  async {
    await _repository.insertACollection(idGame,
        wished,
        _repository.getCollection("username")!.played,
        _repository.getCollection("username")!.owned,
        _repository.getCollection("username")!.rate);
  }

  Future<void> setPlayed(String idGame,bool played) async {
    await _repository.insertACollection(idGame,
        _repository.getCollection("username")!.wish,
        played,
        _repository.getCollection("username")!.owned,
        _repository.getCollection("username")!.rate);
  }

  Future<void> setOwned(String idGame,bool owned) async {
    await _repository.insertACollection(idGame,
        _repository.getCollection("username")!.wish,
            _repository.getCollection("username")!.played,
        owned,
        _repository.getCollection("username")!.rate);
  }

  Future<void> setRate(String idGame, double rate) async {
    await _repository.insertACollection(idGame,
        _repository.getCollection("username")!.wish,
        _repository.getCollection("username")!.played,
        _repository.getCollection("username")!.owned,
        rate);
  }

}

final detailGameBloc = DetailGameBloc();