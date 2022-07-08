import 'package:flutter/material.dart';

import 'api.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: MovieApi.nowShowing(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildMovies(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
            child: SizedBox(
                width: 30, height: 30, child: CircularProgressIndicator()));
      },
    );
  }

  Widget _buildMovies(List<Movie>? movies) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: movies?.length,
      itemBuilder: (context, index) {
        return _buildMovie(movies![index]);
      },
    );
  }

  Widget _buildMovie(Movie movie) {
    return ListTile(
      title: Text(movie.originalTitle),
      subtitle: Text(movie.releaseDate),
      leading: Image.network(
        'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
      ),
    );
  }
}

class MovieSearch extends StatelessWidget {
  const MovieSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
      future: MovieApi.nowShowing(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildMovies(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(
            child: SizedBox(
                width: 30, height: 30, child: CircularProgressIndicator()));
      },
    );
  }

  Widget _buildMovies(List<Movie>? movies) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: movies?.length,
      itemBuilder: (context, index) {
        return _buildMovie(movies![index]);
      },
    );
  }

  Widget _buildMovie(Movie movie) {
    return Container(
        padding: EdgeInsets.all(8),
        width: 150,
        child: Center(
            child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            ),
            Text(movie.originalTitle),
          ],
        )));
  }

  String renderTitleText(String title) {
    if (title.length > 10) {
      title = title.substring(0, 10);
      title = title + "...";
    }
    return title;
  }
}
