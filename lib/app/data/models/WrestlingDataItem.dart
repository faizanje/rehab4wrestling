import 'dart:convert';

class WrestlingDataItem {
  final String name;
  final Data data;

  const WrestlingDataItem({
    required this.name,
    required this.data,
  });

  factory WrestlingDataItem.fromJson(Map<String, dynamic> json) {
    return WrestlingDataItem(
      name: json["name"],
      data: Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "data": this.data,
    };
  }

//

}

class Data {
  final Videos videos;
  final List<Injuries> injuries;

  Data({required this.videos, required this.injuries});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      videos: Videos.fromJson(json["videos"]),
      injuries: List.of(json["injuries"])
          .map((i) => Injuries.fromJson(i) /* can't generate it properly yet */)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "videos": this.videos,
      "injuries": jsonEncode(this.injuries),
    };
  }

//

}

class Videos {
  final List<Rehab> rehab;
  final List<Wrestling> wrestling;

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      rehab: List.of(json["rehab"])
          .map((i) => Rehab.fromJson(i) /* can't generate it properly yet */)
          .toList(),
      wrestling: List.of(json["wrestling"])
          .map(
              (i) => Wrestling.fromJson(i) /* can't generate it properly yet */)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "rehab": jsonEncode(this.rehab),
      "wrestling": jsonEncode(this.wrestling),
    };
  }

  const Videos({
    required this.rehab,
    required this.wrestling,
  });
//

}

class Rehab {
  final String name;
  final String link;

  const Rehab({
    required this.name,
    required this.link,
  });

  factory Rehab.fromJson(Map<String, dynamic> json) {
    return Rehab(
      name: json["name"],
      link: json["link"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "link": this.link,
    };
  }

//

}

class Wrestling {
  final String name;
  final String link;

  const Wrestling({
    required this.name,
    required this.link,
  });

  factory Wrestling.fromJson(Map<String, dynamic> json) {
    return Wrestling(
      name: json["name"],
      link: json["link"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "link": this.link,
    };
  }

//

}

class Injuries {
  final String parent;
  final String name;
  final String description;

  const Injuries({
    required this.parent,
    required this.name,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "parent": this.parent,
      "name": this.name,
      "description": this.description,
    };
  }

  factory Injuries.fromJson(Map<String, dynamic> json) {
    return Injuries(
      parent: json["parent"],
      name: json["name"],
      description: json["description"],
    );
  }
//

}
