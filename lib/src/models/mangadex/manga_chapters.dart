import 'package:json_annotation/json_annotation.dart';

part 'manga_chapters.g.dart';

@JsonSerializable()
class MangaChaptersResponseList {
  final List<MangaChaptersResponse> results;
  final int total;
  final int offset;
  final int limit;

  MangaChaptersResponseList(this.results, this.total, this.offset, this.limit);

  factory MangaChaptersResponseList.fromJson(Map<String, dynamic> json) =>
      _$MangaChaptersResponseListFromJson(json);

  Map<String, dynamic> toJson() => _$MangaChaptersResponseListToJson(this);
}

@JsonSerializable()
class MangaChaptersResponse {
  final String result;
  final MangaChaptersData data;

  MangaChaptersResponse(this.result, this.data);

  factory MangaChaptersResponse.fromJson(Map<String, dynamic> json) =>
      _$MangaChaptersResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MangaChaptersResponseToJson(this);
}

@JsonSerializable()
class MangaChaptersData {
  final String id;
  final String type;
  final MangaChapter attributes;

  MangaChaptersData(this.id, this.type, this.attributes);

  factory MangaChaptersData.fromJson(Map<String, dynamic> json) =>
      _$MangaChaptersDataFromJson(json);

  Map<String, dynamic> toJson() => _$MangaChaptersDataToJson(this);
}

@JsonSerializable()
class MangaChapter {
  final int volume;
  final int version;

  final String chapter;
  final String title;
  final String translatedLanguage;
  final List<String> data;
  final List<String> dataSaver;

  final DateTime publishAt;
  final DateTime createdAt;
  final DateTime updatedAt;

  MangaChapter(
      this.volume,
      this.version,
      this.chapter,
      this.title,
      this.translatedLanguage,
      this.data,
      this.dataSaver,
      this.publishAt,
      this.createdAt,
      this.updatedAt);

  factory MangaChapter.fromJson(Map<String, dynamic> json) =>
      _$MangaChapterFromJson(json);

  Map<String, dynamic> toJson() => _$MangaChapterToJson(this);
}
