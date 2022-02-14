part of 'movie_bloc.dart';

class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovieEvent extends MovieEvent {}

class SearchMovieEvent extends MovieEvent {
  final String search;
  const SearchMovieEvent({
    required this.search,
  });
}
