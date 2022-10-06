import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_request_rest_api_flutter/model/movie.dart';
import 'package:http_status_code/http_status_code.dart';

class HttpService {
  final String apiKey = '8cfb855d7b731341ace5b90889b138a1';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String url = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == StatusCode.OK) {
      if (kDebugMode) {
        print('Successfully get API key from ${url}');
      }
      final jsonResponse = json.decode(result.body);
      if (kDebugMode) {
        // print(jsonResponse.toString());
      }
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((movie) => Movie.fromJson(movie)).toList();

      return movies;
    } else {
      if (kDebugMode) {
        print('Failed to get API key from ${url}');
      }
      return null;
    }
  }
}
