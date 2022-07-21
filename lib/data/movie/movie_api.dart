import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:playground/data/movie/movie_api_repository.dart';
import 'package:playground/model/movie.dart';
import 'dart:convert';

const String apiKey = "6120f2a915e3c21fe03b8e819ee13e72";
const String language = "en-us";

class MovieApi implements MovieApiRepository {
  Uri nowShowing = Uri.https(
    "api.themoviedb.org",
    "/3/movie/now_playing",
    {
      "api_key": apiKey,
      "language": language,
    },
  );

  Uri upcoming = Uri.https(
    "api.themoviedb.org",
    "/3/movie/upcoming",
    {
      "api_key": apiKey,
      "language": language,
    },
  );

  Uri popular = Uri.https(
    "api.themoviedb.org",
    "/3/movie/popular",
    {
      "api_key": apiKey,
      "language": language,
    },
  );

  @override
  Future<List<Movie>> get(String category) async {
    Uri selectedUri = popular;

    if (category == 'popular') {
      selectedUri = popular;
    }
    if (category == 'upcoming') {
      selectedUri = upcoming;
    }
    if (category == 'nowShowing') {
      selectedUri = nowShowing;
    }

    final response = await http.get(selectedUri);
    if (response.statusCode == 200) {
      dynamic json = response.body;
      dynamic dataObject = jsonDecode(json);
      List<Movie> movies = [];
      for (var movie in dataObject["results"]) {
        movies.add(Movie.fromJson(movie));
      }
      return movies;
    } else {
      if (kDebugMode) {
        print('Failed to load tv');
      }
      return [];
    }
  }
}
