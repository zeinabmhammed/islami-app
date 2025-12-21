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
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(color: AppColors.gold),
      child: Column(
        children: [
          Text(
            widget.hadeth.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Text(
                widget.hadeth.content,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 17,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
