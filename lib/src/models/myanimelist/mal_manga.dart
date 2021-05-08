import 'package:json_annotation/json_annotation.dart';

part 'mal_manga.g.dart';

// For responses
@JsonSerializable()
class MALManga {
  final String url;
  final String title;
  final String title_english;
  final String title_japanese;
  final String status;
  final String image_url;
  final String type;
  final String synopsis;

  final int volumes;
  final int chapters;
  final int rank;
  final int scored_by;
  final int popularity;
  final int members;
  final int favorites;

  final double score;

  final bool publishing;

  MALManga(
      this.url,
      this.title,
      this.title_english,
      this.title_japanese,
      this.status,
      this.image_url,
      this.type,
      this.synopsis,
      this.volumes,
      this.chapters,
      this.rank,
      this.scored_by,
      this.popularity,
      this.members,
      this.favorites,
      this.score,
      this.publishing);

  @override
  factory MALManga.fromJson(Map<String, dynamic> json) =>
      _$MALMangaFromJson(json);

  Map<String, dynamic> toJson() => _$MALMangaToJson(this);
}

@JsonSerializable()
class PublishedDate {
  final DateTime from;
  final DateTime to;

  PublishedDate(this.from, this.to);

  @override
  factory PublishedDate.fromJson(Map<String, dynamic> json) =>
      _$PublishedDateFromJson(json);

  Map<String, dynamic> toJson() => _$PublishedDateToJson(this);
}
