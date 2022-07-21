import 'package:playground/model/movie.dart';

abstract class MovieApiRepository {
  Future<List<Movie>> get(String category);
}
