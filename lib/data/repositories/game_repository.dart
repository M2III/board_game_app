import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/providers/local/database/collection_hive_provider.dart';
import 'package:board_game_app/data/providers/remote/game_api_provider.dart';

class GameRepository {
  static final GameRepository _singleton = GameRepository._internal();
  factory GameRepository() => _singleton;

  GameRepository._internal(){
    if(_testCollectionHiveProvide == null){
      CollectionHiveProvider.create().then((provider) => _testCollectionHiveProvide = provider);
    }
  }
  CollectionHiveProvider? _testCollectionHiveProvide;



  Future insertACollection(String idGame,bool wishCollection, bool playedCollection, bool ownedCollection, double rateCollection) async {
    return _testCollectionHiveProvide?.add(idGame, Collections(idGame: idGame, wish: wishCollection, played:playedCollection, owned: ownedCollection, rate: rateCollection,id: idGame));
  }

  List<Collections>? getAll() {
    return _testCollectionHiveProvide?.getAll();
  }

  Collections? get(String key) {
    return _testCollectionHiveProvide?.get(key);
  }

  Collections? getCollection(String key) {
    return _testCollectionHiveProvide?.get(key);
  }


  Future<AllResponseGames> getGamesOrderByRank() {
    return GameApiProvider().getGamesOrderByRank();
  }

  Future<AllResponseGames> getPopularKickstartersOrderByTrendingRank() {
    return GameApiProvider().getPopularKickstartersOrderByTrendingRank();
  }

  Future<AllResponseGames> searchGamesByInput(String input) {
    return GameApiProvider().searchGamesByInput(input);
  }
}