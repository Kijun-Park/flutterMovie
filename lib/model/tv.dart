class TV {
  final int id;
  final String posterPath;
  final String originalTitle;
  final dynamic voteAverage;
  final String releaseDate;

  TV(
      {required this.id,
      required this.posterPath,
      required this.originalTitle,
      required this.voteAverage,
      required this.releaseDate});

  factory TV.fromJson(Map<String, dynamic> json) {
    return TV(
      id: json['id'],
      posterPath: json['poster_path'],
      originalTitle: json['original_name'],
      voteAverage: json['vote_average'],
      releaseDate: json['first_air_date'],
    );
  }
}
