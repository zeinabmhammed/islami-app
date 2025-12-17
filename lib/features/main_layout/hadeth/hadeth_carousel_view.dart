import 'package:flutter/material.dart';
import 'package:islami/features/main_layout/hadeth/hadeth.dart';
import '../../../core/resources/AppColors.dart';

class HadethCarouselView extends StatefulWidget {
  Hadeth hadeth;

  HadethCarouselView(this.hadeth, {super.key});

  @override
  State<HadethCarouselView> createState() => _HadethCarouselViewState();
}

class _HadethCarouselViewState extends State<HadethCarouselView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 49),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.gold,

      ),
      child: Column(
        children: [
          Text(
            widget.hadeth.title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.black),
          ),
          SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                widget.hadeth.content,
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
