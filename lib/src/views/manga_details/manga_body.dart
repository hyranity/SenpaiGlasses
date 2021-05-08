import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/common/ui/vertical_line.dart';
import 'package:senpai_glasses/src/common/ui/horizontal_stats.dart';
import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/models/mangadex/manga_chapters.dart';
import 'package:senpai_glasses/src/models/myanimelist/mal_manga.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/common/ui/tab_row.dart';
import 'package:senpai_glasses/src/views/manga_details/manga_chapter_list.dart';
import 'package:transparent_image/transparent_image.dart';

import 'manga_details.dart';

class MangaBody extends StatefulWidget {
  const MangaBody({
    Key key,
    @required this.malManga,
    this.manga,
    this.chapters,
  }) : super(key: key);

  final MALManga malManga;
  final Manga manga;
  final MangaChaptersResponseList chapters;

  @override
  _MangaBodyState createState() => _MangaBodyState();
}

class _MangaBodyState extends State<MangaBody> {
  bool expandDesc = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          backgroundImage(
            context,
            child: Column(
              children: [
                centerDetails(context),
                TabRow(
                  buttonLabels: ["Chapters", "Reviews", "More info"],
                  onTabSwitch: (index) {
                    print("switched to $index");
                  },
                ),
              ],
            ),
          ),
          MangaChapterList(
            malManga: widget.malManga,
            manga: widget.manga,
            chapters: widget.chapters,
          ),
        ],
      ),
    );
  }

  Align centerDetails(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          // height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width *
              (AppSettings().isMobile ? 0.9 : 0.6),
          margin: EdgeInsets.only(top: 150),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageAndStats(),
              SizedBox(height: 40),
              description(context),
              SizedBox(height: 50),
            ],
          )),
    );
  }

  GestureDetector description(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => expandDesc = expandDesc == false),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        child: AnimatedCrossFade(
          crossFadeState:
              expandDesc ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 300),
          firstChild: Text(
            '${widget.malManga.synopsis}',
            maxLines: null,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppSettings().theme.primary,
            ),
          ),
          secondChild: Text(
            '${widget.malManga.synopsis}',
            overflow: TextOverflow.ellipsis,
            maxLines: 5,
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: AppSettings().theme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget imageAndStats() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 330,
              child: Image.network(
                '${widget.malManga.image_url ?? AppSettings().defaultImageUrl}',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  '${widget.malManga.title}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.poppins(
                    fontSize: 42,
                    fontWeight: FontWeight.w600,
                    color: AppSettings().theme.primary,
                    height: 1,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '${widget.malManga.title_english}',
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: GoogleFonts.poppins(
                    fontSize: 31,
                    fontWeight: FontWeight.w500,
                    color: AppSettings().theme.primary.withOpacity(0.5),
                    height: 1,
                  ),
                ),
                SizedBox(height: 50),
                HorizontalStats(
                  children: [
                    Row(
                      children: [
                        Container(
                          //padding: EdgeInsets.only(bottom: 7),
                          child: Icon(
                            Icons.star,
                            color: AppSettings().theme.primary,
                            size: 25,
                          ),
                        ),
                        SizedBox(width: 7),
                        Text(
                          '${(widget.malManga.score.toStringAsFixed(1) ?? '')}',
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          style: GoogleFonts.poppins(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: AppSettings().theme.primary.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${(widget.malManga.status ?? '')}',
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: AppSettings().theme.primary.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      '#${(widget.malManga.rank ?? '')}',
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: AppSettings().theme.primary.withOpacity(0.5),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget backgroundImage(BuildContext context, {Widget child}) {
    return Stack(
      children: [
        // Actual image
        Positioned.fill(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: FadeInImage.memoryNetwork(
              fadeInDuration: Duration(milliseconds: 300),
              placeholder: kTransparentImage,
              image:
                  '${widget.malManga.image_url ?? AppSettings().defaultImageUrl}',
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Blurry container
        Container(
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(
                sigmaX: 40,
                sigmaY: 40,
              ),
              child: new Container(
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                    color: AppSettings().theme.blurColor.withOpacity(0.72)),
                child: child,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
