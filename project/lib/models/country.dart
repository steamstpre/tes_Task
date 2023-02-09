class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  String? name;
  String? code;
  String? timezone;

  Country copyWith({
    String? name,
    String? code,
    String? timezone,
  }) =>
      Country(
        name: name ?? this.name,
        code: code ?? this.code,
        timezone: timezone ?? this.timezone,
      );

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}
