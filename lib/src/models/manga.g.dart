// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Manga _$MangaFromJson(Map<String, dynamic> json) {
  return Manga(
    json['title'] as String,
    json['description'] as String,
    json['originalLanguage'] as String,
    json['publicationDemographic'] as String,
    json['status'] as String,
    json['contentRating'] as String,
    json['modNotes'] as String,
    json['year'] as int,
    json['lastVolume'] as int,
    json['lastChapter'] as int,
    json['version'] as int,
    (json['alternateTitles'] as List)?.map((e) => e as String)?.toList(),
    (json['authors'] as List)?.map((e) => e as String)?.toList(),
    (json['artists'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MangaToJson(Manga instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'originalLanguage': instance.originalLanguage,
      'publicationDemographic': instance.publicationDemographic,
      'status': instance.status,
      'contentRating': instance.contentRating,
      'modNotes': instance.modNotes,
      'year': instance.year,
      'lastVolume': instance.lastVolume,
      'lastChapter': instance.lastChapter,
      'version': instance.version,
      'alternateTitles': instance.alternateTitles,
      'authors': instance.authors,
      'artists': instance.artists,
    };
