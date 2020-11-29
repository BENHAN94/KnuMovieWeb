class Movie {
  Movie(
      {this.movieId,
      this.originalTitle,
      this.postImage,
      this.endYear,
      this.isAdult,
      this.runningTime,
      this.startYear,
      this.region,
      this.director});
  final int movieId;
  final String originalTitle;
  final String postImage;
  final int runningTime;
  final String startYear;
  final String endYear;
  final bool isAdult;
  final String region;
  List<String> genre;
  List<String> actor;
  final String director;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        movieId: json['movie_id'] as int,
        originalTitle: json['original_title'] as String,
        postImage: json['post_image'] as String,
        runningTime: json['running_time'] as int,
        startYear: json['start_year'] as String,
        endYear: json['end_year'] as String,
        isAdult: json['is_adult'] as bool,
        region: json['region'] as String,
        director: json['name'] as String);
  }
}
