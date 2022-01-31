class Game {
  String? _id;
  String? _name;
  String? _handle;
  String? _url;
  String? _imageUrl;
  num? _averageUserRating;
  String? _publisher;
  int? _yearPublished;
  String? _description;
  int? _minPlayers;
  int? _maxPlayers;
  String? _thumbUrl;
  String? get id => _id;
  String? get name => _name;
  String? get handle => _handle;
  String? get url => _url;
  String? get imageUrl => _imageUrl;
  String? get publisher => _publisher;
  num? get averageUserRating => _averageUserRating;
  int? get yearPublished => _yearPublished;
  String? get description => _description;
  int? get minPlayers => _minPlayers;
  int? get maxPlayers => _maxPlayers;
  String? get thumbUrl => _thumbUrl;

  Game({
    String? id,
    String? name,
    String? handle,
    String? url,
    String? imageUrl,
    String? publisher,
    num? averageUserRating,
    int? yearPublished,
    String? description,
    int? minPlayers,
    int? maxPlayers,
    String? thumbUrl,
  }) {
    _id = id;
    _name = name;
    _handle = handle;
    _url = url;
    _imageUrl = imageUrl;
    _publisher = publisher;
    _yearPublished = yearPublished;
    _description = description;
    _minPlayers = minPlayers;
    _maxPlayers = maxPlayers;
    _thumbUrl = thumbUrl;
  }

  Game.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _handle = json['handle'];
    _url = json['url'];
    _imageUrl = json['image_url'];
    _publisher = json['publisher'];
    _averageUserRating = json['average_user_rating'];
    _yearPublished = json['year_published'];
    _description = json['description'];
    _minPlayers = json['min_players'];
    _maxPlayers = json['max_players'];
    _thumbUrl = json['thumb_url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['handle'] = _handle;
    map['url'] = _url;
    map['image_url'] = _imageUrl;
    map['description'] = _description;
    map['publisher'] = _publisher;
    map['average_user_rating'] = _averageUserRating;
    map['year_published'] = _yearPublished;
    map['min_players'] = _minPlayers;
    map['max_players'] = _maxPlayers;
    map['thumb_url'] = _thumbUrl;
    return map;
  }

  @override
  String toString() {
    return 'Game{_id: $_id, _name: $_name, _handle: $_handle, _url: $_url, _imageUrl: $_imageUrl, _averageUserRating: $_averageUserRating, _publisher: $_publisher, _yearPublished: $_yearPublished, _description: $_description, _minPlayers: $_minPlayers, _maxPlayers: $_maxPlayers, _thumbUrl: $_thumbUrl}';
  }
}

class Images {
  String? _thumb;
  String? _small;
  String? _medium;
  String? _large;
  String? _original;

  String? get thumb => _thumb;
  String? get small => _small;
  String? get medium => _medium;
  String? get large => _large;
  String? get original => _original;

  Images(
      {String? thumb,
      String? small,
      String? medium,
      String? large,
      String? original}) {
    _thumb = thumb;
    _small = small;
    _medium = medium;
    _large = large;
    _original = original;
  }

  Images.fromJson(dynamic json) {
    _thumb = json['thumb'];
    _small = json['small'];
    _medium = json['medium'];
    _large = json['large'];
    _original = json['original'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['thumb'] = _thumb;
    map['small'] = _small;
    map['medium'] = _medium;
    map['large'] = _large;
    map['original'] = _original;
    return map;
  }
}

class HistoricalLowPrices {
  String? _country;
  Date? _date;
  double? _price;
  bool? _isLow;

  String? get country => _country;
  Date? get date => _date;
  double? get price => _price;
  bool? get isLow => _isLow;

  HistoricalLowPrices(
      {String? country, Date? date, double? price, bool? isLow}) {
    _country = country;
    _date = date;
    _price = price;
    _isLow = isLow;
  }

  HistoricalLowPrices.fromJson(dynamic json) {
    _country = json['country'];
    _date = json['date'] != null ? Date.fromJson(json['date']) : null;
    _price = json['price'];
    _isLow = json['isLow'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['country'] = _country;
    if (_date != null) {
      map['date'] = _date?.toJson();
    }
    map['price'] = _price;
    map['isLow'] = _isLow;
    return map;
  }
}

class Date {
  String? _type;
  String? _iso;

  String? get type => _type;
  String? get iso => _iso;

  Date({String? type, String? iso}) {
    _type = type;
    _iso = iso;
  }

  Date.fromJson(dynamic json) {
    _type = json['__type'];
    _iso = json['iso'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['__type'] = _type;
    map['iso'] = _iso;
    return map;
  }
}

class PrimaryDesigner {
  String? _id;
  String? _name;
  String? _url;

  String? get id => _id;
  String? get name => _name;
  String? get url => _url;

  PrimaryDesigner({String? id, String? name, String? url}) {
    _id = id;
    _name = name;
    _url = url;
  }

  PrimaryDesigner.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}

class PrimaryPublisher {
  String? _id;
  String? _name;
  String? _url;

  String? get id => _id;
  String? get name => _name;
  String? get url => _url;

  PrimaryPublisher({String? id, String? name, String? url}) {
    _id = id;
    _name = name;
    _url = url;
  }

  PrimaryPublisher.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _url = json['url'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }
}

class Publishers {
  String? _id;

  String? get id => _id;

  Publishers({String? id}) {
    _id = id;
  }

  Publishers.fromJson(dynamic json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }
}

class Designers {
  String? _id;

  String? get id => _id;

  Designers({String? id}) {
    _id = id;
  }

  Designers.fromJson(dynamic json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }
}

class Categories {
  String? _id;

  String? get id => _id;

  Categories({String? id}) {
    _id = id;
  }

  Categories.fromJson(dynamic json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }
}

class Mechanics {
  String? _id;

  String? get id => _id;

  Mechanics({String? id}) {
    _id = id;
  }

  Mechanics.fromJson(dynamic json) {
    _id = json['id'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    return map;
  }
}

class Msrps {
  String? _country;
  int? _price;

  String? get country => _country;
  int? get price => _price;

  Msrps({String? country, int? price}) {
    _country = country;
    _price = price;
  }

  Msrps.fromJson(dynamic json) {
    _country = json['country'];
    _price = json['price'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['country'] = _country;
    map['price'] = _price;
    return map;
  }
}
