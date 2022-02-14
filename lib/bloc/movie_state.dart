part of 'movie_bloc.dart';

class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<ResultResponse> result;

  const MovieLoaded({
    required this.result,
  });
  @override
  List<Object> get props => [result];
}

class MovieLoadError extends MovieState {
  final String message;
  const MovieLoadError({
    required this.message,
  });
}
