import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
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

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        voteAverage = json['vote_average'] * 1.0,
        overview = json['overview'],
        posterPath = json['poster_path'];

  Map<String, dynamic> toJson() => _$MovieFromJson(this);

  Map<String, dynamic> _$MovieFromJson(Movie instance) => <String, dynamic>{
        'id': instance.id,
        'title': instance.title,
        'voteAverage': instance.voteAverage,
        'overview': instance.overview,
        'posterPath': instance.posterPath,
      };
}
