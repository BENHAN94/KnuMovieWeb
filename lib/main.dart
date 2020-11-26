import 'package:knumovie/model/movie.dart';
import 'dart:async';
import 'API.dart';
import 'model/account.dart';

void main() async {
  var api = API();
  Future<List<Movie>> fMovies =
      api.fetchMovies("", genre: "action", actor: "brad pitt");
  var movies = await fMovies;
  for (Movie m in movies) {
    print(m.originalTitle);
  }

  Future<Account> fAccount = api.signin("knu@knu.ac.kr", "knu");
  var account = await fAccount;
  print(account.lastName);
}
