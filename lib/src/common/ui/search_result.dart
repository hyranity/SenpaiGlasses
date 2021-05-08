import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:senpai_glasses/src/models/mangadex/manga.dart';
import 'package:senpai_glasses/src/models/myanimelist/mal_manga.dart';
import 'package:senpai_glasses/src/util/app_settings.dart';
import 'package:senpai_glasses/src/util/page.dart';
import 'package:senpai_glasses/src/views/manga_details/manga_details.dart';

class SearchResult extends StatefulWidget {
  SearchResult({
    Key key,
    this.manga,
    this.height = 150,
  }) : super(key: key);

  final MangaResponse manga;
  final double height;

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MangaDetails.mangaResponse = widget.manga;
        AppSettings().navigate(MangaDetailsPage());
      },
      child: Container(
        alignment: Alignment.topLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: widget.height,
              child: Image.network(
                '${widget.manga.data.attributes.imageUrl ?? AppSettings().defaultImageUrl}',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    '${widget.manga.data.attributes.title['en']}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppSettings().theme.primary,
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${widget.manga.data.attributes.status}',
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppSettings().theme.primary.withOpacity(0.5),
                      height: 1,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '${(widget.manga.data.attributes.publicationDemographic ?? '').toUpperCase()}',
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppSettings().theme.primary.withOpacity(0.5),
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
