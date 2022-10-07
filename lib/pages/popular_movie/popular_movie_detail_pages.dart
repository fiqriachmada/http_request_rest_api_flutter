import 'package:flutter/material.dart';

class PopularMovieDetailPages extends StatefulWidget {
  const PopularMovieDetailPages({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<PopularMovieDetailPages> createState() =>
      _PopularMovieDetailPagesState();
}

class _PopularMovieDetailPagesState extends State<PopularMovieDetailPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            widget.title,
          ),
        ),
      ),
    );
  }
}
