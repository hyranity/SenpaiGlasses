import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/models/mangadex/manga_chapters.dart';
import 'package:senpai_glasses/src/models/myanimelist/mal_manga.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:intl/intl.dart';
import 'package:senpai_glasses/src/util/duration_format.dart';

class MangaChapterList extends StatefulWidget {
  MangaChapterList({Key key, this.malManga, this.manga, this.chapters})
      : super(key: key);

  final MALManga malManga;
  final Manga manga;
  final MangaChaptersResponseList chapters;

  @override
  _MangaChapterListState createState() => _MangaChapterListState();
}

class _MangaChapterListState extends State<MangaChapterList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 80,
          bottom: 80,
          left: AppSettings().isMobile ? 20 : 80,
          right: AppSettings().isMobile ? 20 : 80),
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var chapter = widget.chapters.results[index].data.attributes;
          return Container(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Stack(
                children: [
                  Text(
                    '${chapter.chapter}',
                    style: GoogleFonts.poppins(
                      color: AppSettings().theme.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 150,
                      ),
                      Container(
                        width: 500,
                        child: Text(
                          '${chapter.title}',
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: AppSettings().theme.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 700,
                      ),
                      Container(
                        // width: 65,
                        padding: EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 6,
                          bottom: 6,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            color: AppSettings().theme.countryTextColors[
                                    chapter.translatedLanguage.toLowerCase()] ??
                                AppSettings().theme.volumeBox),
                        child: Text(
                          '${chapter.translatedLanguage.toUpperCase()}',
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: AppSettings().theme.primary,
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 800,
                      ),
                      Container(
                        // width: 500,
                        child: Text(
                          '${DurationFormat.getDurationLeft(DateTime.now().difference(chapter.createdAt))}',
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                            color: AppSettings().theme.primary,
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 30);
        },
        itemCount: widget.chapters.results.length,
      ),
    );
  }
}
