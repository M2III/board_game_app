import 'package:hive/hive.dart';
part 'collections.g.dart';

@HiveType(typeId:1)
class Collections{
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String idGame;
  @HiveField(2)
  final bool? wish;
  @HiveField(3)
  final bool? played;
  @HiveField(4)
  final bool? have;
  @HiveField(5)
  final double? rate;

  Collections({
    required this.id,
    required this.idGame,
    this.wish, this.played, this.have, this.rate});

//flutter packages pub run build_runner build

}