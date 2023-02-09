class Externals {
  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  int? tvrage;
  int? thetvdb;
  String? imdb;

  Externals copyWith({
    int? tvrage,
    int? thetvdb,
    String? imdb,
  }) =>
      Externals(
        tvrage: tvrage ?? this.tvrage,
        thetvdb: thetvdb ?? this.thetvdb,
        imdb: imdb ?? this.imdb,
      );

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
    tvrage: json["tvrage"],
    thetvdb: json["thetvdb"],
    imdb: json["imdb"],
  );

  Map<String, dynamic> toJson() => {
    "tvrage": tvrage,
    "thetvdb": thetvdb,
    "imdb": imdb,
  };
}