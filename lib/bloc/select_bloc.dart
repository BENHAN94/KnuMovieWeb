import 'package:knumovie/model/movie.dart';
import 'package:rxdart/rxdart.dart';

import '../API.dart';
import '../User.dart';

class SelectBloc {
  final _api = API();
  final _fetcher = PublishSubject<List<Movie>>();

  Observable<List<Movie>> get selectedList => _fetcher.stream;

  fetchList(String uid,
      {String title, String actor, String director, String type}) async {
    List<Movie> fetchedList = await _api.selectMovie(User.uid,
        title: title, actor: actor, director: director, type: type);

    _fetcher.sink.add(fetchedList);
  }

  dispose() {
    _fetcher.close();
  }
}
