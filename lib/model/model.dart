
class MovieModel {
  String? backdropPath;
  int? id;
  String? title;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  String? name;
  String? releasedate;
  String? firstAirDate;
  double? popularity;

  MovieModel({
    this.backdropPath,
    this.id,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.name,
    this.releasedate,
    this.firstAirDate,
    this.popularity,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      backdropPath: json['backdrop_path']?? 'no data',
      id: json['id']?? 'no data',
      title: json['title']?? 'no data',
      originalLanguage: json['original_language']?? 'no data',
      originalTitle: json['original_title']?? 'no data',
      overview: json['overview'],
      posterPath: json['poster_path']?? 'no data',
      releaseDate: json['release_date']?? 'no data',
      voteAverage: json['vote_average']?? 'no data',
      name: json['name']?? 'no data',
      releasedate: json['release_date']?? 'no data',
      firstAirDate: json['first_air_date']??'no data',
      popularity: json['popularity']?? 'no data',
    );
  }
}
