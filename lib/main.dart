// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:playground/data/movie/movie_api.dart';
import 'package:playground/data/movie/movie_provider.dart';
import 'package:playground/data/tv/tv_api.dart';
import 'package:playground/ui/home_screen.dart';
import 'package:playground/ui/movieViewModel/movie_view_model.dart';
import 'package:playground/ui/tvViewModel/tv_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => MovieViewModel(MovieApi())),
            ChangeNotifierProvider(
                create: (BuildContext context) => TVViewModel(TVApi())),
          ],
          child: const Home(),
        ));
  }
}
