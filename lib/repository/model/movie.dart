import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class MovieResponse {
  @JsonKey(name: 'results')
  final List<ResultResponse>? results;

  MovieResponse(this.results);

  factory MovieResponse.fromJson(Map<String, dynamic>? json) =>
      _$MovieResponseFromJson(json ?? {});

  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}

@JsonSerializable()
class ResultResponse {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'year')
  final int? year;
  @JsonKey(name: 'image')
  final ImageResponse image;
  @JsonKey(name: 'principals')
  final List<PrincipalsResponse>? principals;
  ResultResponse({
    required this.id,
    required this.title,
    required this.year,
    required this.image,
    required this.principals,
  });

  factory ResultResponse.fromJson(Map<String, dynamic>? json) =>
      _$ResultResponseFromJson(json ?? {});

  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);
}

@JsonSerializable()
class ImageResponse {
  @JsonKey(name: 'id')
  final String? id;
  @JsonKey(name: 'url')
  final String? url;
  ImageResponse({
    required this.id,
    required this.url,
  });
  factory ImageResponse.fromJson(Map<String, dynamic>? json) =>
      _$ImageResponseFromJson(json ?? {});

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

@JsonSerializable()
class PrincipalsResponse {
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'category')
  final String? category;
  PrincipalsResponse({
    this.name,
    this.category,
  });

  factory PrincipalsResponse.fromJson(Map<String, dynamic> json) =>
      _$PrincipalsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PrincipalsResponseToJson(this);
}
