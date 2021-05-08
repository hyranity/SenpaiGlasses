// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga_chapters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MangaChaptersResponseList _$MangaChaptersResponseListFromJson(
    Map<String, dynamic> json) {
  return MangaChaptersResponseList(
    (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : MangaChaptersResponse.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['total'] as int,
    json['offset'] as int,
    json['limit'] as int,
  );
}

Map<String, dynamic> _$MangaChaptersResponseListToJson(
        MangaChaptersResponseList instance) =>
    <String, dynamic>{
      'results': instance.results,
      'total': instance.total,
      'offset': instance.offset,
      'limit': instance.limit,
    };

MangaChaptersResponse _$MangaChaptersResponseFromJson(
    Map<String, dynamic> json) {
  return MangaChaptersResponse(
    json['result'] as String,
    json['data'] == null
        ? null
        : MangaChaptersData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MangaChaptersResponseToJson(
        MangaChaptersResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
    };

MangaChaptersData _$MangaChaptersDataFromJson(Map<String, dynamic> json) {
  return MangaChaptersData(
    json['id'] as String,
    json['type'] as String,
    json['attributes'] == null
        ? null
        : MangaChapter.fromJson(json['attributes'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MangaChaptersDataToJson(MangaChaptersData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'attributes': instance.attributes,
    };

MangaChapter _$MangaChapterFromJson(Map<String, dynamic> json) {
  return MangaChapter(
    json['volume'] as int,
    json['version'] as int,
    json['chapter'] as String,
    json['title'] as String,
    json['translatedLanguage'] as String,
    (json['data'] as List)?.map((e) => e as String)?.toList(),
    (json['dataSaver'] as List)?.map((e) => e as String)?.toList(),
    json['publishAt'] == null
        ? null
        : DateTime.parse(json['publishAt'] as String),
    json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$MangaChapterToJson(MangaChapter instance) =>
    <String, dynamic>{
      'volume': instance.volume,
      'version': instance.version,
      'chapter': instance.chapter,
      'title': instance.title,
      'translatedLanguage': instance.translatedLanguage,
      'data': instance.data,
      'dataSaver': instance.dataSaver,
      'publishAt': instance.publishAt?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
