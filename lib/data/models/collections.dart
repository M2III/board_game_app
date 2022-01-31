import 'package:hive/hive.dart';
part 'collections.g.dart';

@HiveType(typeId:1)
class Collections{
  @HiveField(0)
  final String idGame;
  @HiveField(1)
  final String nameGame;
  @HiveField(2)
  final String imageUrl;
  @HiveField(3)
  final int minPlayers;
  @HiveField(4)
  final int maxPlayers;
  @HiveField(5)
  bool wished;
  @HiveField(6)
  bool played;
  @HiveField(7)
  bool owned;
  @HiveField(8)
  final double? rate;

  Collections({
    required this.idGame,
    required this.nameGame,
    required this.imageUrl,
    required this.minPlayers,
    required this.maxPlayers,
    required this.wished,
    required this.played,
    required this.owned,
    this.rate});

//flutter packages pub run build_runner build

}