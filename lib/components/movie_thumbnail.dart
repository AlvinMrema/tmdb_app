import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_app/network/service.dart';

import '../models/movie.dart';

class MovieThumbnail extends StatelessWidget {
  final Movie movie;

  const MovieThumbnail({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    final movieThumbnailUrl = Service.thumbnailRootPath + movie.posterPath;

    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: movieThumbnailUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
                width: 160,
                height: 300,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            movie.title,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Text(
            '${((movie.rate * 10) ~/ 1).toString()}%',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
