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
      margin: const EdgeInsets.all(20),
      height: 400,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: movieThumbnailUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                memCacheHeight: 300, //this line
                fit: BoxFit.cover,
                width: 200,
                height: 300,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              movie.title,
              maxLines: 1,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            Text(
              '${((movie.rate * 10) ~/ 1).toString()}%',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
