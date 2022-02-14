import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/repository/model/movie.dart';
import 'package:test_flutter/repository/provider/api_client_response.dart';

part 'detail_movie_event.dart';
part 'detail_movie_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();
  DetailMovieBloc() : super(DetailMovieInitial()) {
    on<GetDetailMovieEvent>(onGetDetailMovieEvent);
  }

  FutureOr<void> onGetDetailMovieEvent(
      GetDetailMovieEvent event, Emitter<DetailMovieState> emit) async {
    emit(DetailMovieLoading());
    try {
      ImageResponse? data = await _apiClientResponse.detailMovie(id: event.id);
      if (data != null) {
        emit(DetailMovieLoaded(result: data));
      }
    } catch (e) {
      emit(const DetailMovieLoadError(message: 'Failed to load data'));
    }
  }
}
