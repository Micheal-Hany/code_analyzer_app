import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF6200EE);
  static const secondary = Color(0xFF03DAC6);
  static const background = Color(0xFFF5F5F5);
  
  static const List<Color> chartColors = [
    Color(0xFF6200EE),
    Color(0xFF03DAC6),
    Color(0xFFFF0266),
    Color(0xFFFFB400),
  ];
  
  static Color getColorForValue(double value) {
    if (value < 0.4) return const Color(0xFFE53935);
    if (value < 0.7) return const Color(0xFFFFB400);
    return const Color(0xFF43A047);
  }
  
  static Color getGradientColor(double value) {
    return Color.lerp(
      const Color(0xFFE53935),
      const Color(0xFF43A047),
      value,
    )!;
  }
}