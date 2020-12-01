# KnuMovieWeb
COMP322 project

import 'package:flutter/material.dart';
import 'movie_bloc.dart';
import '../API.dart';

class MovieProvider extends InheritedWidget {
  // 자식 위젯에서 접근하기 위함
  final MovieBloc movieBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieBloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<MovieProvider>())
          .movieBloc; // static으로 해서 1번만 초기화하도록 함.

  MovieProvider({Key key, MovieBloc movieBloc, Widget child})
      : this.movieBloc = movieBloc ?? MovieBloc(API()),
        super(child: child, key: key);
}

