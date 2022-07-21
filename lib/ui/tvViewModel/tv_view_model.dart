import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:playground/data/tv/tv_api_repository.dart';
import 'package:playground/model/tv.dart';

class TVViewModel with ChangeNotifier {
  final TVApiRepository repository;
  List<TV> _tvs = [];

  UnmodifiableListView<TV> get tvs => UnmodifiableListView(_tvs);

  TVViewModel(this.repository);

  Future<void> fetch(String category) async {
    final result = await repository.get(category);
    _tvs = result;
    notifyListeners();
  }
}
