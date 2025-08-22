import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Title Styles
  static const TextStyle title = TextStyle(
    color: AppColors.white,
    fontSize: 30.60,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w900,
    height: 1.31,
  );
  
  // Description Styles
  static const TextStyle description = TextStyle(
    color: AppColors.white,
    fontSize: 15.30,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    height: 1.90,
  );
  
  // Button Text Styles
  static const TextStyle primaryButton = TextStyle(
    color: AppColors.blueText,
    fontSize: 15.30,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w800,
    height: 1.83,
  );
  
  static const TextStyle secondaryButton = TextStyle(
    color: AppColors.white,
    fontSize: 15.30,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w800,
    height: 1.83,
  );
  
  // Feature Card Text Styles
  static const TextStyle featureCard = TextStyle(
    color: AppColors.white,
    fontSize: 11.90,
    fontFamily: 'Cairo',
    fontWeight: FontWeight.w700,
    height: 1.68,
  );
}
