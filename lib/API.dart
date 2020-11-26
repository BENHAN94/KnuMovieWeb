import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:knumovie/model/movie.dart';
import 'package:http/http.dart' as http;

import 'model/account.dart';

class API {
  // 기본 세팅
  static const _baseURL = 'http://3.34.197.233:3000/';
  http.Client _client = http.Client();

  /* 영화 겸색 ===================================================================== */
  //
  //

  // 영화 제목으로 db에서 fetch
  Future<List<Movie>> fetchMovies(String title,
      {String genre,
      String type,
      String region,
      int runningTime,
      int minRating,
      int maxRating,
      int minStartYear,
      int maxStartYear,
      int minEndYear,
      int maxEndYear,
      String actor}) async {
    var movieURL = _baseURL + "movie?title=" + title;
    if (genre != null) {
      movieURL += "&genre=" + genre;
    }
    if (type != null) {
      movieURL += "&type=" + type;
    }
    if (region != null) {
      movieURL += "&region=" + region;
    }
    if (minRating != null) {
      movieURL += "&minRating=" + minRating.toString();
      movieURL += "&maxRating=" + maxRating.toString();
    }
    if (minStartYear != null) {
      movieURL += "&minStartYear=" + minStartYear.toString();
      movieURL += "&maxStartYear=" + maxStartYear.toString();
    }
    if (runningTime != null) {
      movieURL += "&running_time=" + runningTime.toString();
    }
    if (minEndYear != null) {
      movieURL += "&minEndYear=" + minEndYear.toString();
      movieURL += "&maxEndYear=" + maxEndYear.toString();
    }
    if (actor != null) {
      movieURL += "&actor=" + actor;
    }
    final response = await _client.get(movieURL);
    // compute 함수를 사용하여 parsePhotos를 별도 isolate에서 수행합
    // Json 파싱해서 리스트로 저장
    List<Movie> _parseMovie(String responseBody) {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<Movie>((json) => Movie.fromJson(json)).toList();
    }

    return compute(_parseMovie, response.body);
  }

  // 영상물 정보 확인

/* 회원 관리 ===================================================================== */
//
//

  Future<Account> signup(
      String email, String password, String fname, String lname) async {
    final loginURL = _baseURL + "signup";
    http.Response response = await http.post(
      loginURL,
      headers: <String, String>{
        'Content_Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{
        'email_add': email,
        'password': password,
        'First_name': fname,
        'Last_name': lname
      },
    );
  }

  Future<Account> signin(String email, String password) async {
    final loginURL = _baseURL + "signin";
    final response = await http.post(
      loginURL,
      headers: <String, String>{
        'Content_Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{'email_add': email, 'password': password},
    );
    final jsonResponse = json.decode(response.body);
    Account account = new Account.fromJson(jsonResponse[0]);
    return account;
  }

  Future<bool> updateAccount(String column, String value) async {
    final updateURL = _baseURL + "update_account";
    http.Response response = await http.post(
      updateURL,
      headers: <String, String>{
        'Content_Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{'column': column, 'value': value},
    );
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }

  Future<bool> witdraw(String email) async {
    final updateURL = _baseURL + "withdraw";
    http.Response response = await http.post(
      updateURL,
      headers: <String, String>{
        'Content_Type': 'application/x-www-form-urlencoded',
      },
      body: <String, String>{'email': email},
    );
    if (response.statusCode == 200)
      return true;
    else
      return false;
  }
}
