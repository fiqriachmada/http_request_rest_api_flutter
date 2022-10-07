import 'package:flutter/material.dart';
import 'package:http_request_rest_api_flutter/pages/popular_movie/popular_movie_list_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required String? title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PopularMovieListPages();
  }
}
