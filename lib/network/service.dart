import 'dart:convert';
import 'dart:io';

import 'package:tmdb_app/models/movie.dart';
import 'package:http/http.dart' as http;

class Service {
  static const String thumbnailRootPath =
      'https://www.themoviedb.org/t/p/w220_and_h330_face';

  final String _apiUrl = "https://api.themoviedb.org";
  final String _apiToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjODlmMjgxMzQwNDliZjU2NTU4YzY0NGEyZDQwNzA2YiIsInN1YiI6IjYzNzBiNjk0MTY4NGY3MDBjNGViMzIxYiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ddWZHmLgE9X6DbfHjn2buISCHPmEsV8_ji9EmzpdqRo";

  Future<List<Movie>> getMovies() async {
    final response = await http.get(
      Uri.parse(
        '$_apiUrl/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc',
      ),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $_apiToken',
      },
    );

    if (response.statusCode == 200) {
      final jsonMap = jsonDecode(response.body);
      final results = jsonMap['results'];

      List<Movie> movies = [];
      for (var data in results) {
        final movie = Movie.fromJson(data);
        movies.add(movie);
      }

      return movies;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Movies');
    }
  }
}
