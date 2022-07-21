import 'package:flutter/material.dart';
import 'package:playground/ui/movieViewModel/movie_view_model.dart';
import 'package:playground/ui/tvViewModel/tv_view_model.dart';
import 'package:playground/ui/widget/movie/movie_widget.dart';
import 'package:playground/ui/widget/tv/tv_widget.dart';
import 'package:provider/provider.dart';

const String MOVIE = "movie";
const String TELEVISION = "tv";

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String status = MOVIE;
  late MovieViewModel movieViewModel;
  late TVViewModel tvViewModel;

  @override
  void initState() {
    super.initState();
  }

  onChangeStatus(String status) {
    if (status == MOVIE) {
      movieViewModel.fetch("nowShowing");
    }
    if (status == TELEVISION) {
      tvViewModel.fetch("nowShowing");
    }
    setState(() {
      this.status = status;
    });
  }

  @override
  Widget build(BuildContext context) {
    movieViewModel = context.watch<MovieViewModel>();
    tvViewModel = context.watch<TVViewModel>();

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Movies"),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SubBar(statusChange: onChangeStatus),
        if (status == MOVIE)
          const Expanded(child: Movies())
        else if (status == TELEVISION)
          const Expanded(child: TVs())
      ])),
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
        ],
      );
}
