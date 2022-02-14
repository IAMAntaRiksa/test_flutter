import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/repository/model/movie.dart';
import 'package:test_flutter/repository/provider/api_client_response.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final ApiClientResponse _api = ApiClientResponse();
  MovieBloc() : super(MovieInitial()) {
    on<GetMovieEvent>(onGetMovieEvent);
    on<SearchMovieEvent>(onSearchMovieEvent);
  }

  FutureOr<void> onGetMovieEvent(
      GetMovieEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      final fetchData = await _api.fetchMovie();
      if (fetchData != null) {
        emit(MovieLoaded(result: fetchData));
      }
    } catch (e) {
      emit(const MovieLoadError(message: 'gagal ambil data'));
    }
  }

  FutureOr<void> onSearchMovieEvent(
      SearchMovieEvent event, Emitter<MovieState> emit) async {
    emit(MovieLoading());
    try {
      List<ResultResponse>? listMovie = await _api.fetchMovie();

      List<ResultResponse>? searchList = listMovie?.where((element) {
        return ((element.title) ?? '').toLowerCase().contains(
              event.search.toLowerCase(),
            );
      }).toList();
      if (searchList?.isNotEmpty ?? false) {
        emit(MovieLoaded(result: searchList ?? []));
      }
    } catch (e) {
      emit(const MovieLoadError(message: 'Gagal'));
    }
  }
}
