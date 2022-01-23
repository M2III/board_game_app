import 'dart:async';

import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/repositories/game_repository.dart';

class DetailGameBloc {
  final _gameRepository = GameRepository();

  Future<AllResponseGames> getGame(idGame) {
    return _gameRepository.getGame(idGame);
  }
  
  Collections? getGameDetails(String input)  {
    var collection = _gameRepository.getCollection(input);
    return collection;
  }

  /*Future<void> insertACollection(String idGame,bool wished, bool played, bool owned, double rate)  async {
    await _gameRepository.insertACollection(idGame, wished, played, owned, rate);
  }*/

  Future<void> setWished(
      String idGame,
      String gameName,
      String imageUrl,
      int minPlayers,
      int maxPlayers,
      bool wished,
      double rate)  async {
    await _gameRepository.insertACollection(
        idGame,
        gameName,
        imageUrl,
        minPlayers,
        maxPlayers,
        wished,
        _gameRepository.getCollection(idGame)?.played??false,
        _gameRepository.getCollection(idGame)?.owned??false,
        rate);
  }

  Future<void> setPlayed(
      String idGame,
      String gameName,
      String imageUrl,
      int minPlayers,
      int maxPlayers,
      bool played,
      double rate) async {
    await _gameRepository.insertACollection(
        idGame,
        gameName,
        imageUrl,
        minPlayers,
        maxPlayers,
        _gameRepository.getCollection(idGame)?.wish??false,
        played,
        _gameRepository.getCollection(idGame)?.owned??false,
        rate);
  }

  Future<void> setOwned(
      String idGame,
      String gameName,
      String imageUrl,
      int minPlayers,
      int maxPlayers,
      bool owned,
      double rate) async {
    await _gameRepository.insertACollection(
        idGame,
        gameName,
        imageUrl,
        minPlayers,
        maxPlayers,
        _gameRepository.getCollection(idGame)?.wish??false,
        _gameRepository.getCollection(idGame)?.played??false,
        owned,
        rate);
  }

  Future<void> setRate(
      String idGame,
      String gameName,
      String imageUrl,
      int minPlayers,
      int maxPlayers,
      double rate) async {
    await _gameRepository.insertACollection(
        idGame,
        gameName,
        imageUrl,
        minPlayers,
        maxPlayers,
        _gameRepository.getCollection(idGame)?.wish??false,
        _gameRepository.getCollection(idGame)?.played??false,
        _gameRepository.getCollection(idGame)?.owned??false,
        rate);
  }

}

final detailGameBloc = DetailGameBloc();