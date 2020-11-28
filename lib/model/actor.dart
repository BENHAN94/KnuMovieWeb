class Actor {
  Actor({this.name, this.aid, this.birthYear, this.deathYear});
  final name;
  final aid;
  final birthYear;
  final deathYear;

  factory Actor.fromJson(Map<String, dynamic> json) {
    return Actor(
        name: json['actor_name'] as String,
        aid: json['actor_id'] as int,
        birthYear: json['birth_year'] as int,
        deathYear: json['death_year'] as int);
  }
}
