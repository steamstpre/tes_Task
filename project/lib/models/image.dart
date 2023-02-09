class Image {
  Image({
    this.medium,
    this.original,
  });

  String? medium;
  String? original;

  Image copyWith({
    String? medium,
    String? original,
  }) =>
      Image(
        medium: medium ?? this.medium,
        original: original ?? this.original,
      );

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    medium: json["medium"],
    original: json["original"],
  );

  Map<String, dynamic> toJson() => {
    "medium": medium,
    "original": original,
  };
}