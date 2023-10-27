import 'package:meta/meta.dart';
import 'dart:convert';

class Pokedex {
  final List<Pokemon> pokemon;

  Pokedex({
    required this.pokemon,
  });

  factory Pokedex.fromRawJson(String str) => Pokedex.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
    pokemon: List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pokemon": List<dynamic>.from(pokemon.map((x) => x.toJson())),
  };
}

class Pokemon {
  final int id;
  final String num;
  final String name;
  final String img;
  final List<Type> type;
  final String height;
  final String weight;
  final String candy;
  final int candyCount;
  final Egg egg;
  final double spawnChance;
  final double avgSpawns;
  final String spawnTime;
  final List<double> multipliers;
  final List<Type> weaknesses;
  final List<Evolution> nextEvolution;
  final List<Evolution> prevEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    required this.candyCount,
    required this.egg,
    required this.spawnChance,
    required this.avgSpawns,
    required this.spawnTime,
    required this.multipliers,
    required this.weaknesses,
    required this.nextEvolution,
    required this.prevEvolution,
  });

  factory Pokemon.fromRawJson(String str) => Pokemon.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    num: json["num"],
    name: json["name"],
    img: json["img"],
    type: List<Type>.from(json["type"].map((x) => typeValues.map[x]!)),
    height: json["height"],
    weight: json["weight"],
    candy: json["candy"],
    candyCount: json["candy_count"],
    egg: eggValues.map[json["egg"]]!,
    spawnChance: json["spawn_chance"]?.toDouble(),
    avgSpawns: json["avg_spawns"]?.toDouble(),
    spawnTime: json["spawn_time"],
    multipliers: List<double>.from(json["multipliers"].map((x) => x?.toDouble())),
    weaknesses: List<Type>.from(json["weaknesses"].map((x) => typeValues.map[x]!)),
    nextEvolution: List<Evolution>.from(json["next_evolution"].map((x) => Evolution.fromJson(x))),
    prevEvolution: List<Evolution>.from(json["prev_evolution"].map((x) => Evolution.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "num": num,
    "name": name,
    "img": img,
    "type": List<dynamic>.from(type.map((x) => typeValues.reverse[x])),
    "height": height,
    "weight": weight,
    "candy": candy,
    "candy_count": candyCount,
    "egg": eggValues.reverse[egg],
    "spawn_chance": spawnChance,
    "avg_spawns": avgSpawns,
    "spawn_time": spawnTime,
    "multipliers": List<dynamic>.from(multipliers.map((x) => x)),
    "weaknesses": List<dynamic>.from(weaknesses.map((x) => typeValues.reverse[x])),
    "next_evolution": List<dynamic>.from(nextEvolution.map((x) => x.toJson())),
    "prev_evolution": List<dynamic>.from(prevEvolution.map((x) => x.toJson())),
  };
}

enum Egg {
  NOT_IN_EGGS,
  OMANYTE_CANDY,
  THE_10_KM,
  THE_2_KM,
  THE_5_KM
}

final eggValues = EnumValues({
  "Not in Eggs": Egg.NOT_IN_EGGS,
  "Omanyte Candy": Egg.OMANYTE_CANDY,
  "10 km": Egg.THE_10_KM,
  "2 km": Egg.THE_2_KM,
  "5 km": Egg.THE_5_KM
});

class Evolution {
  final String num;
  final String name;

  Evolution({
    required this.num,
    required this.name,
  });

  factory Evolution.fromRawJson(String str) => Evolution.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
    num: json["num"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "num": num,
    "name": name,
  };
}

enum Type {
  BUG,
  DARK,
  DRAGON,
  ELECTRIC,
  FAIRY,
  FIGHTING,
  FIRE,
  FLYING,
  GHOST,
  GRASS,
  GROUND,
  ICE,
  NORMAL,
  POISON,
  PSYCHIC,
  ROCK,
  STEEL,
  WATER
}

final typeValues = EnumValues({
  "Bug": Type.BUG,
  "Dark": Type.DARK,
  "Dragon": Type.DRAGON,
  "Electric": Type.ELECTRIC,
  "Fairy": Type.FAIRY,
  "Fighting": Type.FIGHTING,
  "Fire": Type.FIRE,
  "Flying": Type.FLYING,
  "Ghost": Type.GHOST,
  "Grass": Type.GRASS,
  "Ground": Type.GROUND,
  "Ice": Type.ICE,
  "Normal": Type.NORMAL,
  "Poison": Type.POISON,
  "Psychic": Type.PSYCHIC,
  "Rock": Type.ROCK,
  "Steel": Type.STEEL,
  "Water": Type.WATER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
