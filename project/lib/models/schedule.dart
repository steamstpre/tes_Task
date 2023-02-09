class Schedule {
  Schedule({
    this.time,
    this.days,
  });

  String? time;
  List<String>? days;

  Schedule copyWith({
    String? time,
    List<String>? days,
  }) =>
      Schedule(
        time: time ?? this.time,
        days: days ?? this.days,
      );

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: json["days"] == null
            ? []
            : List<String>.from(json["days"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "time": time,
        "days": days == null ? [] : List<dynamic>.from(days!.map((x) => x)),
      };
}
