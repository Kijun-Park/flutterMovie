import 'package:playground/model/tv.dart';

abstract class TVApiRepository {
  Future<List<TV>> get(String category);
}
