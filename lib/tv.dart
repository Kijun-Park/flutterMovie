// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';

import 'api.dart';

class TVs extends StatelessWidget {
  const TVs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TV>>(
      future: TVApi.airing(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _buildTVs(snapshot.data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return Center(
            child: SizedBox(
                width: 30, height: 30, child: CircularProgressIndicator()));
      },
    );
  }

  Widget _buildTVs(List<TV>? TVs) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: TVs?.length,
      itemBuilder: (context, index) {
        return _buildTV(TVs![index]);
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