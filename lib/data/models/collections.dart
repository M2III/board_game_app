import 'package:hive/hive.dart';
part 'collections.g.dart';

@HiveType(typeId:1)
class Collections{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String idGame;
  @HiveField(2)
  bool wish;
  @HiveField(3)
  bool played;
  @HiveField(4)
  bool owned;
  @HiveField(5)
  final double rate;

  Collections({
    required this.id,
    required this.idGame,
    required this.wish, required this.played, required this.owned, required this.rate});

//flutter packages pub run build_runner build

}