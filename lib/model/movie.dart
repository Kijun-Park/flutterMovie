class Movie {
  final int id;
  final String posterPath;
  final String originalTitle;
  final dynamic voteAverage;
  final String releaseDate;

  Movie(
      {required this.id,
      required this.posterPath,
      required this.originalTitle,
      required this.voteAverage,
      required this.releaseDate});
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      posterPath: json['poster_path'],
      originalTitle: json['original_title'],
      voteAverage: json['vote_average'],
      releaseDate: json['release_date'],
    );
  }
}
