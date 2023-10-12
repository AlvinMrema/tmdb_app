class Movie {
  final int movieId;
  final String title;
  final num rate; // vote_average;
  final String posterPath;

  Movie({
    required this.movieId,
    required this.title,
    required this.rate,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      movieId: json['id'] as int,
      title: json['title'] as String,
      rate: json['vote_average'] as num,
      posterPath: json['poster_path'] as String,
    );
  }
}
