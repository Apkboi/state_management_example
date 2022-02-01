import 'package:flutter/foundation.dart';
import 'package:state_management_example/helpers/api_helper.dart';
import 'package:state_management_example/model/movies_response.dart';

class MoviesRepository {
  Future<List<Movie>?> getMovies() async {
    try {
      var path =
          '/movie/now_playing?api_key=${ApiHelper.apiKey}&language=en-US&page=1';
      debugPrint(path);
      final response = await ApiHelper.dio.get(path);
      MoviesResponse moviesResponse = MoviesResponse.fromMap(response.data);
      return moviesResponse.results!;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
