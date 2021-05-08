import 'package:json_annotation/json_annotation.dart';

part 'manga.g.dart';

@JsonSerializable()
class MangaResponseList {
  final List<MangaResponse> results;
  final int total;
  final int offset;
  final int limit;

  MangaResponseList(this.results, this.total, this.offset, this.limit);

  factory MangaResponseList.fromJson(Map<String, dynamic> json) =>
      _$MangaResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$MangaResponseListToJson(this);
}

@JsonSerializable()
class MangaResponse {
  final String result;
  final MangaData data;

  MangaResponse(this.result, this.data);

  factory MangaResponse.fromJson(Map<String, dynamic> json) =>
      _$MangaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MangaResponseToJson(this);
}

@JsonSerializable()
class MangaData {
  final String id;
  final String type;
  final Manga attributes;

  MangaData(this.id, this.type, this.attributes);

  factory MangaData.fromJson(Map<String, dynamic> json) =>
      _$MangaDataFromJson(json);

  Map<String, dynamic> toJson() => _$MangaDataToJson(this);
}

// For responses
@JsonSerializable()
class Manga {
  final String originalLanguage;
  final String publicationDemographic;
  final String status;
  final String contentRating;
  final String modNotes;
  final String imageUrl;

  final String lastChapter;

  final int year;
  final int lastVolume;
  final int version;

  final List<String> alternateTitles;
  final List<String> authors;
  final List<String> artists;
  final Map<String, String> title;
  final Map<String, String> description;

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
      this.artists,
      this.imageUrl);

  @override
  factory Manga.fromJson(Map<String, dynamic> json) => _$MangaFromJson(json);

  Map<String, dynamic> toJson() => _$MangaToJson(this);
}
