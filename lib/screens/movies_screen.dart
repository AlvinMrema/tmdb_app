import 'package:flutter/material.dart';

import '../components/movies_grid_view.dart';
import '../network/service.dart';

class MoviesScreen extends StatelessWidget {
  final moviesData = Service().getMovies();
  MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: moviesData,
      builder: (context, snapshot) {
        // print(snapshot.data);
        if (snapshot.hasData) {
          // return Text(snapshot.data!.first.title);
          return movieGridView(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
