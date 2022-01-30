import 'package:board_game_app/data/models/all_response_games.dart';
import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/providers/local/database/collection_hive_provider.dart';
import 'package:board_game_app/data/providers/remote/game_api_provider.dart';

class CollectionRepository {
  static final CollectionRepository _singleton = CollectionRepository._internal();
  factory CollectionRepository() => _singleton;

  CollectionRepository._internal(){
    if(_testCollectionHiveProvide == null){
      CollectionHiveProvider.create().then((provider) => _testCollectionHiveProvide = provider);
    }
  }
  CollectionHiveProvider? _testCollectionHiveProvide;

  Future insertACollection(String idGame,String nameGame, String imgUrl, int maxPlayers, int minPlayers, bool wishCollection, bool playedCollection, bool ownedCollection, double rateCollection) async {
    return _testCollectionHiveProvide?.add(idGame,
        Collections(idGame: idGame, nameGame: nameGame,
            imageUrl: imgUrl,
            maxPlayers: maxPlayers,
            minPlayers: minPlayers, wish: wishCollection,
            played:playedCollection, owned: ownedCollection, rate: rateCollection));
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

  Future<void>? deleteACollection(String key) {
    return _testCollectionHiveProvide?.delete(key);
  }

  Future<AllResponseGames> getGame(String idGame) {
    return GameApiProvider().getGame(idGame);
  }
}