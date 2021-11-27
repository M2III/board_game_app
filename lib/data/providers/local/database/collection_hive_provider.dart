import 'package:board_game_app/data/models/collections.dart';
import 'package:board_game_app/data/providers/local/database/base_hive_provider.dart';
import 'package:hive/hive.dart';

class CollectionHiveProvider extends BaseHiveProvider<Collections,CollectionHiveProvider>{
  CollectionHiveProvider._privateConstructor();
  static final CollectionHiveProvider _singleton= CollectionHiveProvider._privateConstructor();

  factory CollectionHiveProvider()=> _singleton;
  static Box<Collections>? _box;

  static Future<CollectionHiveProvider> create() async{
    final component = CollectionHiveProvider();
    Hive.registerAdapter<Collections>(CollectionsAdapter());
    _box = await Hive.openBox('Collections');
    return component;
  }

  @override
  Future<void> add(String key, Collections object) => _box!.put(key,object);

  @override
  Future<void> addAll(Map<String, Collections> map) => _box!.putAll(map);

  @override
  Future<void> clear() => _box!.clear();

  @override
  Future<void> close() => _box!.close();

  @override
  Future<void> delete(String key) => _box!.delete(key);

  @override
  Collections? get(String id) => _box!.get(id);

  @override
  List<Collections> getAll() =>List<Collections>.from(_box!.values.toList());

  @override
  Map<dynamic, dynamic> getMap() => _box!.toMap();




}