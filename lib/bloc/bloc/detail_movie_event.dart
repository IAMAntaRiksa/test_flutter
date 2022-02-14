part of 'detail_movie_bloc.dart';

class DetailMovieEvent extends Equatable {
  const DetailMovieEvent();

  @override
  List<Object> get props => [];
}

class GetDetailMovieEvent extends DetailMovieEvent {
  final String id;

  const GetDetailMovieEvent({
    required this.id,
  });
  @override
  List<Object> get props => [id];
}
