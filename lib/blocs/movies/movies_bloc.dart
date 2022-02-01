import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_example/blocs/movies/movies_event.dart';
import 'package:state_management_example/blocs/movies/movies_state.dart';
import 'package:state_management_example/repository/movies_repo.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final MoviesRepository repository = MoviesRepository();

  MoviesBloc() : super(MoviesInitial()) {
    on<FetchMovieListEvent>(_mapFetchMovieListEventToState);
  }
  FutureOr<void> _mapFetchMovieListEventToState(
      FetchMovieListEvent event, Emitter emit) async {
    emit(MovieListLoadingState());
    var movies = await repository.getMovies();
    if (movies != null) {
      emit(MovieListFetchedState(movies: movies));
    }else{
      emit(FetchMovieListErrorState(error: "An error occured"));
    }
  }
}
