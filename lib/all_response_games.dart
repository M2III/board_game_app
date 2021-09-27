




import 'package:board_game_app/game.dart';



class All_response_games {
  Count? _count;
  List<Game>? _results;

  Count? get count => _count;
  List<Game>? get results => _results ?? [];

  All_response_games({
    Count? count,
    List<Game>? results}){
    _count = count;
    _results = results;
  }

  All_response_games.fromJson(dynamic json) {
    _count = json['count'] != null ? Count.fromJson(json['count']) : null;
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Game.fromJson(v));
      });
    }
  }

  Map<String, Game> toJson() {
    var map = <String, Game>{};
    if (_count != null) {
      map['count'] = _count?.toJson() as Game;
    }
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()) as Game ;
    }
    return map;
  }

}



class Count {
  int? _count;


  int? get count => _count;


  Count({
    int? count,
    }){
    _count = count;

  }

  Count.fromJson(dynamic json) {
    _count = json['count'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['count'] = _count;
    return map;
  }

}