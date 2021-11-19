// To parse this JSON data, do
//
//     final moviesResponse = moviesResponseFromMap(jsonString);

import 'dart:convert';

MoviesResponse moviesResponseFromMap(String str) => MoviesResponse.fromMap(json.decode(str));

String moviesResponseToMap(MoviesResponse data) => json.encode(data.toMap());

class MoviesResponse {
    MoviesResponse({
        this.dates,
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    Dates? dates;
    int? page;
    List<Movie>? results;
    int? totalPages;
    int? totalResults;

    MoviesResponse copyWith({
        Dates? dates,
        int? page,
        List<Movie>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        MoviesResponse(
            dates: dates ?? this.dates,
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory MoviesResponse.fromMap(Map<String, dynamic> json) => MoviesResponse(
        dates: json["dates"] == null ? null : Dates.fromMap(json["dates"]),
        page: json["page"],
        results: json["results"] == null ? null : List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "dates": dates == null ? null : dates!.toMap(),
        "page": page,
        "results": results == null ? null : List<dynamic>.from(results!.map((x) => x.toMap())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Dates {
    Dates({
        required this.maximum,
        required this.minimum,
    });

    DateTime maximum;
    DateTime minimum;

    Dates copyWith({
        DateTime? maximum,
        DateTime? minimum,
    }) => 
        Dates(
            maximum: maximum ?? this.maximum,
            minimum: minimum ?? this.minimum,
        );

    factory Dates.fromMap(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toMap() => {
        "maximum": "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":"${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
    };
}

class Movie {
    Movie({
        this.adult,
        this.backdropPath,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    bool? adult;
    String? backdropPath;
    List<int>? genreIds;
    int? id;
    OriginalLanguage? originalLanguage;
    String? originalTitle;
    String? overview;
    double? popularity;
    String? posterPath;
    DateTime? releaseDate;
    String? title;
    bool? video;
    double? voteAverage;
    int? voteCount;

    Movie copyWith({
        bool? adult,
        String? backdropPath,
        List<int>? genreIds,
        int? id,
        OriginalLanguage? originalLanguage,
        String? originalTitle,
        String? overview,
        double? popularity,
        String? posterPath,
        DateTime? releaseDate,
        String? title,
        bool? video,
        double? voteAverage,
        int? voteCount,
    }) => 
        Movie(
            adult: adult ?? this.adult,
            backdropPath: backdropPath ?? this.backdropPath,
            genreIds: genreIds ?? this.genreIds,
            id: id ?? this.id,
            originalLanguage: originalLanguage ?? this.originalLanguage,
            originalTitle: originalTitle ?? this.originalTitle,
            overview: overview ?? this.overview,
            popularity: popularity ?? this.popularity,
            posterPath: posterPath ?? this.posterPath,
            releaseDate: releaseDate ?? this.releaseDate,
            title: title ?? this.title,
            video: video ?? this.video,
            voteAverage: voteAverage ?? this.voteAverage,
            voteCount: voteCount ?? this.voteCount,
        );

    factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? null : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"] == null ? null : originalLanguageValues.map![json["original_language"]],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? null : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage == null ? null : originalLanguageValues.reverse![originalLanguage],
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate == null ? null : "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

enum OriginalLanguage { en, es, pl }

final originalLanguageValues = EnumValues({
    "en": OriginalLanguage.en,
    "es": OriginalLanguage.es,
    "pl": OriginalLanguage.pl
});

class EnumValues<T> {
    Map<String, T>? map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map!.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
