import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/ui/chapter_details/verse_item.dart';
import 'package:islami/ui/common/app_screen_wrapper.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/sura.dart';

class ChapterDetails extends StatefulWidget {
  const ChapterDetails({super.key});

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var chapter = ModalRoute.of(context)!.settings.arguments as Chapter;

    if (verses.isEmpty) {
      loadVerses(chapter.chapterIndex);
    }

    return AppScreenWrapper(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(title: Text(chapter.englishName), elevation: 0),
        body: AppScreenWrapper(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  AppImages.icBottomDecoration,
                  width: double.infinity,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Image.asset(AppImages.icLeft, width: 93),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              chapter.arabicName,
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Image.asset(
                            AppImages.icRight,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 115),
                      child: ListView.separated(
                        itemBuilder: (context, index) =>
                            VerseItem(verses[index], index + 1),
                        separatorBuilder: (context, index) => Container(
                          height: 1,
                          margin: EdgeInsets.symmetric(horizontal: 32),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        itemCount: verses.length,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadVerses(int chapterIndex) async {
    String content = await rootBundle.loadString(
      "assets/files/$chapterIndex.txt",
    );
    List<String> lines = content.trim().split("\n");

    setState(() {
      verses = lines;
    });
  }
}
