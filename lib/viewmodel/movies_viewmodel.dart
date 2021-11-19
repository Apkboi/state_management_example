import 'package:flutter/material.dart';
import 'package:state_management_example/helpers/api_helper.dart';
import 'package:state_management_example/model/movies_response.dart';

enum MovieListState {
  idle,
  loading,
  loaded,
  error,
}

class MoviesViewModel extends ChangeNotifier {
  List<Movie> movies = [];

  MovieListState _state = MovieListState.idle;

  MovieListState get movieListState => _state;

  Future<void> getMovies() async {
    try {
      _state = MovieListState.loading;
      notifyListeners();
      var path =
          '/movie/now_playing?api_key=${ApiHelper.apiKey}&language=en-US&page=1';
      debugPrint(path);
      final response = await ApiHelper.dio.get(path);
      MoviesResponse moviesResponse = MoviesResponse.fromMap(response.data);
      movies = moviesResponse.results!;
      _state = MovieListState.loaded;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
      _state = MovieListState.error;
      notifyListeners();
    }
  }
}
