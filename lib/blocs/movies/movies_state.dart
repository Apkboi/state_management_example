import 'package:state_management_example/model/movies_response.dart';

abstract class MoviesState{
  
} 
class MoviesInitial extends MoviesState{}

class MovieListLoadingState extends MoviesState{}

class MovieListFetchedState extends MoviesState{
  final List<Movie> movies;
  MovieListFetchedState({required this.movies});
}

class FetchMovieListErrorState extends MoviesState{
  final String error;
  FetchMovieListErrorState({required this.error});
}