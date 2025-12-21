import 'package:flutter/material.dart';
import '../../../../core/resources/AppColors.dart';
import '../../../../data/local_data_source/on_boarding_data.dart';

class PageViewItemWidget extends StatelessWidget {
  final OnBoardingData data;

  const PageViewItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(data.imagePath),
        Text(
          data.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.gold,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 12),
        if (data.description != null)
          Text(
            data.description!,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: AppColors.gold,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
