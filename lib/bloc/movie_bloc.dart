import 'dart:async';
import '../model/movie.dart';
import '../API.dart';

class MovieBloc {
  final API api;

  StreamController<List<Movie>> ctrl = StreamController();

  Stream<List<Movie>> get results => ctrl.stream; // 바로 스트림에 접근하지 않기 위해 만들었습니다.​
  MovieBloc(this.api);

  void dispose() {
    ctrl.close(); // 스트림은 안 쓸 때 닫아줘야합니다.
  }
// void getActors(String name) {
//     api.selectActor(name: name).then((movies){
//       ctrl.add(movies);
//     });
//   }

//   void getDirectors(String name) {
//     api.selectDirector(name: name).then((movies){
//       ctrl.add(movies);
//     });
//   }
  void getMovies(int uid, String title) {
    api.selectMovie(uid, title: title).then((movies) {
      ctrl.add(movies);
    });
  }

  void getEpisodes(int uid, String title) {
    api.selectMovie(uid, type: 'tvSeries', title: title).then((movies) {
      ctrl.add(movies);
    });
  }

  void getDetail(
    int uid,
    String genre,
    String type,
    String region,
    int runningTime,
    int minRating,
    int maxRating,
    int minStartYear,
    int maxStartYear,
    int minEndYear,
    int maxEndYear,
    String actor,
    String director,
    String title,
  ) {
    api
        .selectMovie(uid,
            actor: actor,
            director: director,
            genre: genre,
            minStartYear: minStartYear,
            maxStartYear: maxStartYear,
            minEndYear: minEndYear,
            maxEndYear: maxEndYear,
            minRating: minRating,
            maxRating: maxRating,
            runningTime: runningTime,
            type: type,
            title: title,
            region: region)
        .then((movies) {
      ctrl.add(movies);
    });
  }
}
