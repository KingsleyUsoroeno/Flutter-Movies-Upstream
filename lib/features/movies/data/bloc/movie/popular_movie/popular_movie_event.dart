import 'package:equatable/equatable.dart';

abstract class PopularMovieEvent extends Equatable {
  const PopularMovieEvent();

  @override
  List<Object> get props => [];
}

class FetchPopularMovies extends PopularMovieEvent {}

class RefreshPopularMovies extends PopularMovieEvent {}
