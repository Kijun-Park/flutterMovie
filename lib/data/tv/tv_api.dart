import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:playground/data/tv/tv_api_repository.dart';
import 'dart:convert';

import 'package:playground/model/tv.dart';

const String apiKey = "6120f2a915e3c21fe03b8e819ee13e72";
const String language = "en-us";

class TVApi implements TVApiRepository {
  Uri nowShowing = Uri.https(
    "api.themoviedb.org",
    "/3/tv/airing_today",
    {
      "api_key": apiKey,
      "language": language,
    },
  );

  Uri topRated = Uri.https(
    "api.themoviedb.org",
    "/3/tv/top_rated",
    {
      "api_key": apiKey,
      "language": language,
    },
  );

  Uri popular = Uri.https(
    "api.themoviedb.org",
    "/3/tv/popular",
    {
      "api_key": apiKey,
      "language": language,
    },
  );

  @override
  Future<List<TV>> get(String category) async {
    Uri selectedUri = nowShowing;

    if (category == 'topRated') {
      selectedUri = topRated;
    }
    if (category == 'nowShowing') {
      selectedUri = nowShowing;
    }
    if (category == 'popular') {
      selectedUri = popular;
    }

    final response = await http.get(selectedUri);
    if (response.statusCode == 200) {
      dynamic json = response.body;
      dynamic dataObject = jsonDecode(json);
      List<TV> tvs = [];
      for (var movie in dataObject["results"]) {
        tvs.add(TV.fromJson(movie));
      }
      return tvs;
    } else {
      if (kDebugMode) {
        print('Failed to load tv');
      }
      return [];
    }
  }
}
