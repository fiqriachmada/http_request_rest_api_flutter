import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http_request_rest_api_flutter/pages/popular_movie/popular_movie_detail_pages.dart';
import 'package:http_request_rest_api_flutter/services/http_service.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List movies = [];
  HttpService service = HttpService();

  Future initialize() async {
    movies = [];
    movies = (await service.getPopularMovies())!;
    setState(() {
      moviesCount = movies.length;
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('moviesCount $moviesCount');
    }
    if (kDebugMode) {
      print('movies $movies');
    }
    const image = "https://image.tmdb.org/t/p/w500";
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'Popular Movies',
        ),
      ),
      body: ListView.builder(
        // itemCount: (moviesCount == null) ? 0 : moviesCount,
        itemCount: moviesCount,
        itemBuilder: (context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage:
                    NetworkImage(image + movies[position].posterPath),
              ),
              title: Text(
                movies[position].title,
              ),
              subtitle: Text(
                'Rating: ${movies[position].voteAverage.toString()}',
              ),
              onTap: () {
                if (kDebugMode) {
                  print(movies[position].title);
                  print(movies[position].voteAverage.toString());
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopularMovieDetailPages(
                      title: movies[position].title.toString(),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
