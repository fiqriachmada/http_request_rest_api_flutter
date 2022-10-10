import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/pages/popular_movie/popular_movie_detail_pages.dart';
import 'package:http_request_rest_api_flutter/services/popular_movie_service.dart';

class PopularMovieListPages extends StatefulWidget {
  const PopularMovieListPages({Key? key}) : super(key: key);

  @override
  State<PopularMovieListPages> createState() => _PopularMovieListPagesState();
}

class _PopularMovieListPagesState extends State<PopularMovieListPages> {
  int moviesCount = 0;
  List movies = [];
  PopularMovieService service = PopularMovieService();

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
    service = PopularMovieService();
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
                  print(image + movies[position].posterPath.toString());
                  print(movies[position].overview.toString());
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PopularMovieDetailPages(
                      title: movies[position].title.toString(),
                      image: image + movies[position].posterPath,
                      overview: movies[position].overview,
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
