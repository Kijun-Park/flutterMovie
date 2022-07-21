import 'package:flutter/material.dart';
import 'package:playground/ui/movieViewModel/movie_view_model.dart';

class MovieProvider extends InheritedWidget {
  final MovieViewModel viewModel;

  const MovieProvider(
      {Key? key, required this.viewModel, required Widget child})
      : super(key: key, child: child);

  static MovieProvider of(BuildContext context) {
    final MovieProvider? result =
        context.dependOnInheritedWidgetOfExactType<MovieProvider>();
    assert(result != null, 'No Movie');
    return result!;
  }

  @override
  bool updateShouldNotify(MovieProvider oldWidget) {
    return true;
  }
}
