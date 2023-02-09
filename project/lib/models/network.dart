import 'package:project/models/country.dart';

class Network {
  Network({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  int? id;
  String? name;
  Country? country;
  dynamic officialSite;

  Network copyWith({
    int? id,
    String? name,
    Country? country,
    dynamic officialSite,
  }) =>
      Network(
        id: id ?? this.id,
        name: name ?? this.name,
        country: country ?? this.country,
        officialSite: officialSite ?? this.officialSite,
      );

  factory Network.fromJson(Map<String, dynamic> json) => Network(
    id: json["id"],
    name: json["name"],
    country: json["country"] == null ? null : Country.fromJson(json["country"]),
    officialSite: json["officialSite"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "country": country?.toJson(),
    "officialSite": officialSite,
  };
}