import 'dart:convert';

import 'package:http/http.dart' as http;

const String apiKey = "6120f2a915e3c21fe03b8e819ee13e72";
const String language = "en-us";

class MovieApi {
  static Future<List<Movie>> nowShowing() async {
    Uri uri = Uri.https(
      "api.themoviedb.org",
      "/3/movie/now_playing",
      {
        "api_key": apiKey,
        "language": language,
      },
    );

    return await get(uri);
  }

  static Future<List<Movie>> upcoming() async {
    Uri uri = Uri.https(
      "api.themoviedb.org",
      "/3/movie/upcoming",
      {
        "api_key": apiKey,
        "language": language,
      },
    );

    return await get(uri);
  }

  static Future<List<Movie>> popular() async {
    Uri uri = Uri.https(
      "api.themoviedb.org",
      "/3/movie/popular",
      {
        "api_key": apiKey,
        "language": language,
      },
    );

    return await get(uri);
  }

  static Future<List<Movie>> get(Uri uriObj) async {
    final response = await http.get(uriObj);
    if (response.statusCode == 200) {
      dynamic json = response.body;
      dynamic dataObject = jsonDecode(json);
      List<Movie> movies = [];
      for (var movie in dataObject["results"]) {
        movies.add(Movie.fromJson(movie));
      }
      return movies;
    } else {
      print('Failed to load tv');
      return [];
    }
  }
}

class TVApi {
  static Future<List<TV>> airing() async {
    Uri uri = Uri.https(
      "api.themoviedb.org",
      "/3/tv/airing_today",
      {
        "api_key": apiKey,
        "language": language,
      },
    );

    return await get(uri);
  }

  static Future<List<TV>> topRated() async {
    Uri uri = Uri.https(
      "api.themoviedb.org",
      "/3/tv/top_rated",
      {
        "api_key": apiKey,
        "language": language,
      },
    );

    return await get(uri);
  }

  static Future<List<TV>> popular() async {
    Uri uri = Uri.https(
      "api.themoviedb.org",
      "/3/tv/popular",
      {
        "api_key": apiKey,
        "language": language,
      },
    );

    return await get(uri);
  }

  static Future<List<TV>> get(Uri uriObj) async {
    final response = await http.get(uriObj);
    if (response.statusCode == 200) {
      dynamic json = response.body;
      dynamic dataObject = jsonDecode(json);
      List<TV> TVs = [];
      for (var movie in dataObject["results"]) {
        TVs.add(TV.fromJson(movie));
      }
      return TVs;
    } else {
      print('Failed to load tv');
      return [];
    }
  }
}

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
