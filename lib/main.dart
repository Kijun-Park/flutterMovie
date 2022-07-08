// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

import 'api.dart';
import "movie.dart";
import "tv.dart";

const String MOVIE = "movie";
const String TELEVISION = "tv";
const String SEARCH = "search";
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: const Home(),
    );
  }
}

class SubBar extends StatefulWidget {
  Function? statusChange;
  SubBar({Key? key, this.statusChange}) : super(key: key);

  @override
  SubBarState createState() => SubBarState();
}

class SubBarState extends State<SubBar> {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () {
              widget.statusChange!(MOVIE);
            },
            child: const Text('Movie'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.statusChange!(TELEVISION);
              });
            },
            child: const Text('TV'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                widget.statusChange!(SEARCH);
              });
            },
            child: const Text('Search'),
          ),
        ],
      );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String status = MOVIE;

  @override
  void initState() {
    super.initState();
  }

  onChangeStatus(String status) {
    this.setState(() {
      this.status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Container(
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SubBar(statusChange: this.onChangeStatus),
          if (status == MOVIE)
            Expanded(child: MovieSearch())
          else if (status == TELEVISION)
            Expanded(child: TVs())
          else if (status == SEARCH)
            Expanded(child: Text('Search'))
        ])),
      ),
    );
  }
}
