class Movie {
  int id;
  String title;
  double voteAverage;
  String overview;
  String posterPath;

  Movie(
    this.id,
    this.title,
    this.voteAverage,
    this.overview,
    this.posterPath,
  );

  Movie.fromJson(Map<String, dynamic> parsedJson)
      : id = parsedJson['id'],
        title = parsedJson['title'],
        voteAverage = parsedJson['voteAverage'] * 1.0,
        overview = parsedJson['overview'],
        posterPath = parsedJson['posterPath'];
}
