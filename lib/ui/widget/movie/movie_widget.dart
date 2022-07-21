import 'package:flutter/material.dart';
import 'package:playground/model/movie.dart';
import 'package:playground/ui/movieViewModel/movie_view_model.dart';
import 'package:provider/provider.dart';

class Movies extends StatelessWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MovieViewModel>();

    if (viewModel.movies.isNotEmpty) {
      return _buildMovies(viewModel.movies);
    } else {
      return const Center(
          child: SizedBox(
              width: 30, height: 30, child: CircularProgressIndicator()));
    }
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
