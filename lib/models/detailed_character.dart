class DetailedCharacter {
  DetailedCharacter({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });
  late final int id;
  late final String name;
  late final String status;
  late final String species;
  late final String type;
  late final String gender;
  late final Origin origin;
  late final Location location;
  late final String image;
  late final List<String> episode;
  late final String url;
  late final String created;
  late int firstEpisode = _getFirstEpisode();

  int _getFirstEpisode() {
    var firstEpisodeUrl = Uri.parse(episode[0]);
    var episodeId = int.parse(firstEpisodeUrl.pathSegments.last);
    return episodeId;
  }

  DetailedCharacter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    species = json['species'];
    type = json['type'];
    gender = json['gender'];
    origin = Origin.fromJson(json['origin']);
    location = Location.fromJson(json['location']);
    image = json['image'];
    episode = List.castFrom<dynamic, String>(json['episode']);
    url = json['url'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['status'] = status;
    _data['species'] = species;
    _data['type'] = type;
    _data['gender'] = gender;
    _data['origin'] = origin.toJson();
    _data['location'] = location.toJson();
    _data['image'] = image;
    _data['episode'] = episode;
    _data['url'] = url;
    _data['created'] = created;
    return _data;
  }
}

class Origin {
  Origin({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Origin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}

class DetailedEpisode {
  DetailedEpisode({
    required this.id,
    required this.name,
    required this.air_date,
    required this.episode,
    required this.characters,
  });

  late final int id;
  late final String name;
  late final String air_date;
  late final String episode;
  late final List<String> characters;

  DetailedEpisode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    air_date = json['air_date'];
    episode = json['episode'];
    characters = json['characters'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['air_date'] = air_date;
    _data['episode'] = episode;
    _data['characters'] = characters;
    return _data;
  }
}

class Location {
  Location({
    required this.name,
    required this.url,
  });
  late final String name;
  late final String url;

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['url'] = url;
    return _data;
  }
}
