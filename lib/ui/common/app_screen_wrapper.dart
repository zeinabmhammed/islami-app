import 'package:flutter/material.dart';
import 'package:islami/ui/design.dart';

class AppScreenWrapper extends StatelessWidget {
  Widget child;
  String backgroundImagePath;

  AppScreenWrapper({
    required this.child,
    this.backgroundImagePath = AppImages.defaultBackground,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  }
}
