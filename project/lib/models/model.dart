// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

import 'package:project/models/show.dart';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
  Model({
    this.score,
    this.show,
  });

  double? score;
  Show? show;

  Model copyWith({
    double? score,
    Show? show,
  }) =>
      Model(
        score: score ?? this.score,
        show: show ?? this.show,
      );

  factory Model.fromJson(Map<String, dynamic> json) => Model(
    score: json["score"]?.toDouble(),
    show: json["show"] == null ? null : Show.fromJson(json["show"]),
  );

  Map<String, dynamic> toJson() => {
    "score": score,
    "show": show?.toJson(),
  };
}













