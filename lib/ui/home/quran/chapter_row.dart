import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/routes.dart';
import 'package:islami/ui/chapter.dart';

class ChapterRow extends StatelessWidget {
  Chapter chapter;

  ChapterRow({required this.chapter, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.ChapterDetails.route,
          arguments: chapter,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(21),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: Svg(AppImages.icChapter)),
                  ),
                  child: Text(
                    "${chapter.chapterIndex}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: "Janna LT",
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapter.englishName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${chapter.versesNumbers} verses',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              chapter.arabicName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
