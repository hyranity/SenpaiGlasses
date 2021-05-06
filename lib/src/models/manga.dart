import 'package:json_annotation/json_annotation.dart';

part 'manga.g.dart';

@JsonSerializable()
class Manga {
  final String title;
  final String description;
  final String originalLanguage;
  final String publicationDemographic;
  final String status;
  final String contentRating;
  final String modNotes;

  final int year;
  final int lastVolume;
  final int lastChapter;
  final int version;

  final List<String> alternateTitles;
  final List<String> authors;
  final List<String> artists;

  Manga(
      this.title,
      this.description,
      this.originalLanguage,
      this.publicationDemographic,
      this.status,
      this.contentRating,
      this.modNotes,
      this.year,
      this.lastVolume,
      this.lastChapter,
      this.version,
      this.alternateTitles,
      this.authors,
      this.artists);

  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  Map<String, dynamic> toJson() => _$MangaToJson(this);
}
