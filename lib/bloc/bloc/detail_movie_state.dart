part of 'detail_movie_bloc.dart';

class DetailMovieState extends Equatable {
  const DetailMovieState();

  @override
  List<Object> get props => [];
}

class DetailMovieInitial extends DetailMovieState {}

class DetailMovieLoading extends DetailMovieState {}

class DetailMovieLoaded extends DetailMovieState {
  final ImageResponse result;
  const DetailMovieLoaded({
    required this.result,
  });
  @override
  List<Object> get props => [result];
}

class DetailMovieLoadError extends DetailMovieState {
  final String message;
  const DetailMovieLoadError({
    required this.message,
  });
}
