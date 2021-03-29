import 'package:data/model/movie_entity.dart';
import 'package:data/model/result_entity.dart';
import 'package:domain/model/movie.dart';
import 'package:domain/model/result.dart';

import 'base/entity_mapper.dart';

class MovieMapper extends EntityMapper<MovieEntity, Movie> {
  @override
  Movie mapFromEntity(MovieEntity entity) {
    return Movie(
      page: entity.page,
      totalPages: entity.totalPages,
      totalResults: entity.totalResults,
      results: entity.results
          .map((e) => MovieResult(
              popularity: e.popularity,
              voteCount: e.voteCount,
              video: e.video,
              posterPath: e.posterPath,
              id: e.id,
              adult: e.adult,
              backdropPath: e.backdropPath,
              originalLanguage: e.originalLanguage,
              originalTitle: e.originalTitle,
              genreIds: e.genreIds,
              title: e.title,
              overview: e.overview,
              releaseDate: e.releaseDate))
          .toList(),
    );
  }

  @override
  MovieEntity mapToEntity(Movie domain) {
    return MovieEntity(
      page: domain.page,
      totalPages: domain.totalPages,
      totalResults: domain.totalResults,
      results: domain.results
          .map((e) => ResultEntity(
              popularity: e.popularity,
              voteCount: e.voteCount,
              video: e.video,
              posterPath: e.posterPath,
              id: e.id,
              adult: e.adult,
              backdropPath: e.backdropPath,
              originalLanguage: e.originalLanguage,
              originalTitle: e.originalTitle,
              genreIds: e.genreIds,
              title: e.title,
              overview: e.overview,
              releaseDate: e.releaseDate))
          .toList(),
    );
  }

  List<Movie> mapFromEntityList(List<MovieEntity> movieEntity) {
    return movieEntity.map((e) => mapFromEntity(e)).toList();
  }
}
