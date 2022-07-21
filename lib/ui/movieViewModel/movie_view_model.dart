import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:playground/data/movie/movie_api_repository.dart';
import 'package:playground/model/movie.dart';

class MovieViewModel with ChangeNotifier {
  final MovieApiRepository repository;
  List<Movie> _movies = [];

  UnmodifiableListView<Movie> get movies => UnmodifiableListView(_movies);

  MovieViewModel(this.repository);

  Future<void> fetch(String category) async {
    final result = await repository.get(category);
    _movies = result;
    notifyListeners();
  }
}
