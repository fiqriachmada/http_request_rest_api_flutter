import 'package:flutter/material.dart';

class PopularMovieDetailPages extends StatefulWidget {
  const PopularMovieDetailPages({
    Key? key,
    required this.title,
    required this.image,
    required this.overview,
  }) : super(key: key);
  final String title;
  final image;
  final overview;

  @override
  State<PopularMovieDetailPages> createState() =>
      _PopularMovieDetailPagesState();
}

class _PopularMovieDetailPagesState extends State<PopularMovieDetailPages> {
  @override
  Widget build(BuildContext context) {
    const image = "https://image.tmdb.org/t/p/w500";
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            widget.title,
          ),
        ),
      ),
      body: SizedBox(
          child: Column(
        children: <Widget>[
          Image.network(widget.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.overview,
              style: const TextStyle(
                // backgroundColor: Colors.amber,
                color: Color.fromARGB(255, 7, 77, 255),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
