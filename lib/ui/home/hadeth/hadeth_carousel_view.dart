import 'package:flutter/material.dart';
import 'package:islami/ui/design.dart';
import 'package:islami/ui/home/hadeth/hadeth.dart';

class HadethCarouselView extends StatelessWidget {
  Hadeth hadeth;

  HadethCarouselView(this.hadeth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 49),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.gold,
        image: DecorationImage(
          image: AssetImage(AppImages.hadethBackground),
          fit: BoxFit.contain,
        ),
      ),
      child: Column(
        children: [
          Text(
            hadeth.title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.black),
          ),
          SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                hadeth.content,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
