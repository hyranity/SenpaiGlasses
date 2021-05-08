// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mal_manga.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MALManga _$MALMangaFromJson(Map<String, dynamic> json) {
  return MALManga(
    json['url'] as String,
    json['title'] as String,
    json['title_english'] as String,
    json['title_japanese'] as String,
    json['status'] as String,
    json['image_url'] as String,
    json['type'] as String,
    json['synopsis'] as String,
    json['volumes'] as int,
    json['chapters'] as int,
    json['rank'] as int,
    json['scored_by'] as int,
    json['popularity'] as int,
    json['members'] as int,
    json['favorites'] as int,
    (json['score'] as num)?.toDouble(),
    json['publishing'] as bool,
  );
}

Map<String, dynamic> _$MALMangaToJson(MALManga instance) => <String, dynamic>{
      'url': instance.url,
      'title': instance.title,
      'title_english': instance.title_english,
      'title_japanese': instance.title_japanese,
      'status': instance.status,
      'image_url': instance.image_url,
      'type': instance.type,
      'synopsis': instance.synopsis,
      'volumes': instance.volumes,
      'chapters': instance.chapters,
      'rank': instance.rank,
      'scored_by': instance.scored_by,
      'popularity': instance.popularity,
      'members': instance.members,
      'favorites': instance.favorites,
      'score': instance.score,
      'publishing': instance.publishing,
    };

PublishedDate _$PublishedDateFromJson(Map<String, dynamic> json) {
  return PublishedDate(
    json['from'] == null ? null : DateTime.parse(json['from'] as String),
    json['to'] == null ? null : DateTime.parse(json['to'] as String),
  );
}

Map<String, dynamic> _$PublishedDateToJson(PublishedDate instance) =>
    <String, dynamic>{
      'from': instance.from?.toIso8601String(),
      'to': instance.to?.toIso8601String(),
    };
