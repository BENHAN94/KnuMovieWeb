class Log {
  Log({
    this.movieId,
    this.originalTitle,
    this.datePart,
    this.rating,
  });
  final int movieId;
  final String originalTitle;
  final int datePart;
  final int rating;

  factory Log.fromJson(Map<String, dynamic> json) {
    return Log(
        movieId: json['movie_id'] as int,
        originalTitle: json['original_title'] as String,
        datePart: json['date_part'] as int,
        rating: json['single_rating'] as int);
  }
}
