import 'package:flutter/material.dart';
import 'package:playground/model/tv.dart';
import 'package:playground/ui/tvViewModel/tv_view_model.dart';
import 'package:provider/provider.dart';

class TVs extends StatelessWidget {
  const TVs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TVViewModel>();

    if (viewModel.tvs.isNotEmpty) {
      return _buildTVs(viewModel.tvs);
    } else {
      return const Center(
          child: SizedBox(
              width: 30, height: 30, child: CircularProgressIndicator()));
    }
  }

  Widget _buildTVs(List<TV>? tvs) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tvs?.length,
      itemBuilder: (context, index) {
        return _buildTV(tvs![index]);
      },
    );
  }

  Widget _buildTV(TV tv) {
    return ListTile(
      title: Text(tv.originalTitle),
      subtitle: Text(tv.releaseDate),
      leading: Image.network(
        'https://image.tmdb.org/t/p/w500/${tv.posterPath}',
      ),
    );
  }
}
