// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Popular welcomeFromJson(String str) => Popular.fromJson(json.decode(str));

String welcomeToJson(Popular data) => json.encode(data.toJson());

class Popular {
  Popular({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory Popular.fromJson(Map<String, dynamic> json) => Popular(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  Result({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
  });

  bool adult;
  int gender;
  int id;
  List<KnownFor> knownFor;
  String knownForDepartment;
  String name;
  double popularity;
  String profilePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    adult: json["adult"],
    gender: json["gender"],
    id: json["id"],
    knownFor: List<KnownFor>.from(json["known_for"].map((x) => KnownFor.fromJson(x))),
    knownForDepartment: json["known_for_department"],
    name: json["name"],
    popularity: json["popularity"].toDouble(),
    profilePath: json["profile_path"],
  );

  Map<String, dynamic> toJson() => {
    "adult": adult,
    "gender": gender,
    "id": id,
    "known_for": List<dynamic>.from(knownFor.map((x) => x.toJson())),
    "known_for_department": knownForDepartment,
    "name": name,
    "popularity": popularity,
    "profile_path": profilePath,
  };
}

class KnownFor {
  KnownFor({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.mediaType,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.originalTitle,
    this.releaseDate,
    this.title,
    this.video,
  });

  String backdropPath;
  DateTime firstAirDate;
  List<int> genreIds;
  int id;
  String mediaType;
  String name;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  String posterPath;
  double voteAverage;
  int voteCount;
  bool adult;
  String originalTitle;
  DateTime releaseDate;
  String title;
  bool video;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
    backdropPath: json["backdrop_path"],
    firstAirDate: json["first_air_date"] == null ? null : DateTime.parse(json["first_air_date"]),
    genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    id: json["id"],
    mediaType: json["media_type"],
    name: json["name"] == null ? null : json["name"],
    originCountry: json["origin_country"] == null ? null : List<String>.from(json["origin_country"].map((x) => x)),
    originalLanguage: json["original_language"],
    originalName: json["original_name"] == null ? null : json["original_name"],
    overview: json["overview"],
    posterPath: json["poster_path"],
    voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
    adult: json["adult"] == null ? null : json["adult"],
    originalTitle: json["original_title"] == null ? null : json["original_title"],
    releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
    title: json["title"] == null ? null : json["title"],
    video: json["video"] == null ? null : json["video"],
  );

  Map<String, dynamic> toJson() => {
    "backdrop_path": backdropPath,
    "first_air_date": firstAirDate == null ? null : "${firstAirDate.year.toString().padLeft(4, '0')}-${firstAirDate.month.toString().padLeft(2, '0')}-${firstAirDate.day.toString().padLeft(2, '0')}",
    "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
    "id": id,
    "media_type": mediaType,
    "name": name == null ? null : name,
    "origin_country": originCountry == null ? null : List<dynamic>.from(originCountry.map((x) => x)),
    "original_language": originalLanguage,
    "original_name": originalName == null ? null : originalName,
    "overview": overview,
    "poster_path": posterPath,
    "vote_average": voteAverage,
    "vote_count": voteCount,
    "adult": adult == null ? null : adult,
    "original_title": originalTitle == null ? null : originalTitle,
    "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
    "title": title == null ? null : title,
    "video": video == null ? null : video,
  };
}
