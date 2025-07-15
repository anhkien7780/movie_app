

class Movie {
  int id;
  String backdropPath;
  String overview;
  String originalTitle;
  String posterPath;
  List<String> genres;
  int runTime;
  String releaseDate;
  double voteAverage;

  Movie(
    this.id,
    this.originalTitle,
    this.overview,
    this.genres,
    this.backdropPath,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    this.runTime,
  );

  factory Movie.fromJson(Map<String, dynamic> json) {
    final List<dynamic> genreList = json["genres"];
    return Movie(
      json["id"] as int,
      json["original_title"] as String,
      json["overview"] as String,
      genreList.map((genre) => genre["name"] as String).toList(),
      json["backdrop_path"] as String,
      json["poster_path"] as String,
      json["release_date"] as String,
      json["vote_average"] as double,
      json["runtime"] as int,
    );
  }
}
