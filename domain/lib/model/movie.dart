import 'result.dart';

class Movie {
  int page;
  int totalResults;
  int totalPages;
  List<MovieResult> results;

  Movie({
    int page,
    int totalResults,
    int totalPages,
    List<MovieResult> results,
  }) {
    this.page = page;
    this.totalResults = totalResults;
    this.totalPages = totalPages;
    this.results = results;
  }

  Movie.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalResults = json['totalresults'];
    totalPages = json['totalpages'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results.add(MovieResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['totalresults'] = this.totalResults;
    data['totalpages'] = this.totalPages;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Movies{page: $page, totalResults: $totalResults, '
        'totalPages: $totalPages, results: $results}';
  }
}
