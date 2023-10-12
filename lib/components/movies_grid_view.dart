import 'package:flutter/material.dart';

import '../models/movie.dart';
import 'movie_thumbnail.dart';

Widget movieGridView(List<Movie> movies) {
  return
      // Padding(
      //   padding: const EdgeInsets.only(
      //     left: 16,
      //     right: 16,
      //     top: 16,
      //   ),
      //   child:
      GridView.builder(
    itemCount: movies.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 220 / 330,
    ),
    itemBuilder: (context, index) {
      final movie = movies[index];
      return MovieThumbnail(movie: movie);
    },
  );
  // );
}
