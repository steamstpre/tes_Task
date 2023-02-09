import 'package:project/models/externals.dart';
import 'package:project/models/image.dart';
import 'package:project/models/network.dart';
import 'package:project/models/rating.dart';
import 'package:project/models/schedule.dart';

class Show {
  Show({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
  });

  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  String? status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  dynamic webChannel;
  dynamic dvdCountry;
  Externals? externals;
  Image? image;

  Show copyWith({
    int? id,
    String? url,
    String? name,
    String? type,
    String? language,
    List<String>? genres,
    String? status,
    int? runtime,
    int? averageRuntime,
    DateTime? premiered,
    DateTime? ended,
    String? officialSite,
    Schedule? schedule,
    Rating? rating,
    int? weight,
    Network? network,
    dynamic webChannel,
    dynamic dvdCountry,
    Externals? externals,
    Image? image,
  }) =>
      Show(
        id: id ?? this.id,
        url: url ?? this.url,
        name: name ?? this.name,
        type: type ?? this.type,
        language: language ?? this.language,
        genres: genres ?? this.genres,
        status: status ?? this.status,
        runtime: runtime ?? this.runtime,
        averageRuntime: averageRuntime ?? this.averageRuntime,
        premiered: premiered ?? this.premiered,
        ended: ended ?? this.ended,
        officialSite: officialSite ?? this.officialSite,
        schedule: schedule ?? this.schedule,
        rating: rating ?? this.rating,
        weight: weight ?? this.weight,
        network: network ?? this.network,
        webChannel: webChannel ?? this.webChannel,
        dvdCountry: dvdCountry ?? this.dvdCountry,
        externals: externals ?? this.externals,
        image: image ?? this.image,
      );

  factory Show.fromJson(Map<String, dynamic> json) => Show(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: json["genres"] == null
            ? []
            : List<String>.from(json["genres"]!.map((x) => x)),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"] == null
            ? null
            : DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        weight: json["weight"],
        network:
            json["network"] == null ? null : Network.fromJson(json["network"]),
        webChannel: json["webChannel"],
        dvdCountry: json["dvdCountry"],
        externals: json["externals"] == null
            ? null
            : Externals.fromJson(json["externals"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres":
            genres == null ? [] : List<dynamic>.from(genres!.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered":
            "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        "ended":
            "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite,
        "schedule": schedule?.toJson(),
        "rating": rating?.toJson(),
        "weight": weight,
        "network": network?.toJson(),
        "webChannel": webChannel,
        "dvdCountry": dvdCountry,
        "externals": externals?.toJson(),
        "image": image?.toJson(),
      };
}
