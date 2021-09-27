import 'game.dart';



class AllResponseGames {
  /*int? _count;*/
  List<Game>? _results;

  /*int? get count => _count;*/
  List<Game>? get results => _results ?? [];

  AllResponseGames({
    /*int? count,*/
    List<Game>? results}){
    /*_count = count;*/
    _results = results;
  }

  AllResponseGames.fromJson(dynamic json) {
    /*_count = json['count'] != null ? json['count'] : null;*/
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Game.fromJson(v));
      });
    }
  }

  Map<String, Game> toJson() {
    var map = <String, Game>{};
/*    if (_count != null) {
      map['count'] = _count as Game;
    }*/
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()) as Game ;
    }
    return map;
  }

}



/*
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

}*/
