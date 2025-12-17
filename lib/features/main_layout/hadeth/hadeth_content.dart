import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/features/main_layout/hadeth/hadeth.dart';
import 'package:islami/features/main_layout/hadeth/hadeth_carousel_view.dart';

class HadethContent extends StatefulWidget {
  const HadethContent({super.key});

  @override
  State<HadethContent> createState() => _HadethContentState();
}

class _HadethContentState extends State<HadethContent> {
  final CarouselController controller = CarouselController(initialItem: 0);

  List<Hadeth> allHadeth = [];

  @override
  void initState() {
    super.initState();
    loadHadethFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: allHadeth.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : CarouselView.weighted(
        controller: controller,
        itemSnapping: true,
        flexWeights: const <int>[1, 10, 1],
        children: allHadeth.map((Hadeth hadeth) {
          return HadethCarouselView(hadeth);
        }).toList(),
      ),
    );
  }

  void loadHadethFiles() async {
    String fileContent =
    await rootBundle.loadString("assets/files/ahadeth.txt");

    List<String> hadethContentList = fileContent.trim().split("#");

    for (int i = 0; i < hadethContentList.length; i++) {
      String singleHadethContent = hadethContentList[i].trim();
      int indexOfFirstLine = singleHadethContent.indexOf("\n");
      String title = singleHadethContent.substring(0, indexOfFirstLine);
      String content = singleHadethContent.substring(indexOfFirstLine + 1);

      Hadeth hadeth = Hadeth(title, content);
      allHadeth.add(hadeth);
    }

    setState(() {});
  }
}