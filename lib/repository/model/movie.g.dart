// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieResponse _$MovieResponseFromJson(Map<String, dynamic> json) =>
    MovieResponse(
      (json['results'] as List<dynamic>?)
          ?.map((e) => ResultResponse.fromJson(e as Map<String, dynamic>?))
          .toList(),
    );

Map<String, dynamic> _$MovieResponseToJson(MovieResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ResultResponse _$ResultResponseFromJson(Map<String, dynamic> json) =>
    ResultResponse(
      id: json['id'] as String?,
      title: json['title'] as String?,
      year: json['year'] as int?,
      image: ImageResponse.fromJson(json['image'] as Map<String, dynamic>?),
      principals: (json['principals'] as List<dynamic>?)
          ?.map((e) => PrincipalsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultResponseToJson(ResultResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'year': instance.year,
      'image': instance.image,
      'principals': instance.principals,
    };

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
    };

PrincipalsResponse _$PrincipalsResponseFromJson(Map<String, dynamic> json) =>
    PrincipalsResponse(
      name: json['name'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$PrincipalsResponseToJson(PrincipalsResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
    };
