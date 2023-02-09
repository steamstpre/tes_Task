class Rating {
  Rating({
    this.average,
  });

  double? average;

  Rating copyWith({
    double? average,
  }) =>
      Rating(
        average: average ?? this.average,
      );

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    average: json["average"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "average": average,
  };
}