class PageModel<T> {
  PageModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  PageModel.fromJson(dynamic json) {
    page = json['page'];
    results = json['results'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  int? page;
  List<T>? results;
  int? totalPages;
  int? totalResults;

  PageModel copyWith({
    int? page,
    List<T>? results,
    int? totalPages,
    int? totalResults,
  }) =>
      PageModel(
        page: page ?? this.page,
        results: results ?? this.results,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );
}
