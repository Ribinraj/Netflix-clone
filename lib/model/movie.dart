

class Movie {
  String title;
  String backDroppath;
  String originalTitle;
  String overview;
  String posterPath;
  String releseDate;
  double voteAverage;
  Movie({
    required this.title,
    required this.backDroppath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releseDate,
    required this.voteAverage,
  });
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json["title"],
        backDroppath: json["backdrop_path"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        releseDate: json["release_date"],
        voteAverage: json["vote_average"]as double);
  }
  // Map<String, dynamic> toJson() => {

  // };
}
