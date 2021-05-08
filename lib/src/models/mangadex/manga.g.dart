// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaResponseList _$MangaResponseListFromJson(Map<String, dynamic> json) {
  return MangaResponseList(
    (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : MangaResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total'] as int,
    json['offset'] as int,
    json['limit'] as int,
  );
}

Map<String, dynamic> _$MangaResponseListToJson(MangaResponseList instance) =>
    <String, dynamic>{
      'results': instance.results,
      'total': instance.total,
      'offset': instance.offset,
      'limit': instance.limit,
    };

MangaResponse _$MangaResponseFromJson(Map<String, dynamic> json) {
  return MangaResponse(
    json['result'] as String,
    json['data'] == null
        ? null
        : MangaData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MangaResponseToJson(MangaResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

MangaData _$MangaDataFromJson(Map<String, dynamic> json) {
  return MangaData(
    json['id'] as String,
    json['type'] as String,
    json['attributes'] == null
        ? null
        : Manga.fromJson(json['attributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MangaDataToJson(MangaData instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

Manga _$MangaFromJson(Map<String, dynamic> json) {
  return Manga(
    (json['title'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    (json['description'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    json['originalLanguage'] as String,
    json['publicationDemographic'] as String,
    json['status'] as String,
    json['contentRating'] as String,
    json['modNotes'] as String,
    json['year'] as int,
    json['lastVolume'] as int,
    json['lastChapter'] as String,
    json['version'] as int,
    (json['alternateTitles'] as List)?.map((e) => e as String)?.toList(),
    (json['authors'] as List)?.map((e) => e as String)?.toList(),
    (json['artists'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$MangaToJson(Manga instance) => <String, dynamic>{
      'originalLanguage': instance.originalLanguage,
      'publicationDemographic': instance.publicationDemographic,
      'status': instance.status,
      'contentRating': instance.contentRating,
      'modNotes': instance.modNotes,
      'lastChapter': instance.lastChapter,
      'year': instance.year,
      'lastVolume': instance.lastVolume,
      'version': instance.version,
      'alternateTitles': instance.alternateTitles,
      'authors': instance.authors,
      'artists': instance.artists,
      'title': instance.title,
      'description': instance.description,
    };
