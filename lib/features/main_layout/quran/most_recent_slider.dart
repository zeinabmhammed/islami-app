import 'package:flutter/material.dart';
import 'package:islami/features/main_layout/quran/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';
import '../../../core/resources/AppColors.dart';
import '../../../core/resources/AppImages.dart';
import '../../../data/local_data_source/chapter.dart';

class MostRecentSlider extends StatefulWidget {
   MostRecentSlider({super.key});

  @override
  State<MostRecentSlider> createState() => _MostRecentSliderState();
}

class _MostRecentSliderState extends State<MostRecentSlider> {
  List<Chapter> visitedChapters = []  ;

  @override
   void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MostRecentProvider provider = Provider.of<MostRecentProvider>(context);
    visitedChapters = provider.mostRecentChapters;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text("Most Recently",
        style: Theme.of(context).textTheme.titleSmall,
        ),
        SizedBox(height: 10),
        Container(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColors.gold,
                ),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.7,
               child: Stack(
                 children: [
                   Row(
                     children: [
                       Expanded(child: Container()),

                   Expanded(child: Image.asset(AppImages.mostRecentBackground,
                   height: double.infinity,
                   width: double.infinity,
                   ),
                   ),
                 ],
               ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(visitedChapters[index].englishName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).primaryColor
                  ),
                  ),

                  Text(visitedChapters[index].arabicName,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).primaryColor
                      ),
                  ),
                  Text("${visitedChapters[index].versesNumbers} verses",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: Theme.of(context).primaryColor
                      )
                  ),
                ],
              )
             ]
               ),
              );

            },
            separatorBuilder:(context, index) => SizedBox(width: 10),
            itemCount:visitedChapters.length,
          ),
        ),
        SizedBox(height: 10),
      ]
    );
  }
}
