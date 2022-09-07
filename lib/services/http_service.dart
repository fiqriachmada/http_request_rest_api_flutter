import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_request_rest_api_flutter/model/movie.dart';
import 'package:http_status_code/http_status_code.dart';

class HttpService {
  final String apiKey = '8cfb855d7b731341ace5b90889b138a1';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future getPopularMovies() async {
    final String url = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == StatusCode.OK) {
      print('Sukses Data Terambil');
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((movie) => Movie.fromJson(movie)).toList();

      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
