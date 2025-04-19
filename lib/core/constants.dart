import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF673AB7); // Deep purple
  static const Color accentColor = Color(0xFF03A9F4); // Light blue
  static const Color backgroundColor = Color(0xFFF5F5F5); // Light gray
  static const Color darkBackgroundColor = Color(0xFF121212); // Dark surface variant

  // Vitals card colors
  static const Color heartRateColor = Color(0xFFE91E63);
  static const Color stepsColor = Color(0xFF4CAF50);
  static const Color sleepColor = Color(0xFF2196F3);
  static const Color bloodPressureColor = Color(0xFF9C27B0);
  static const Color stressColor = Color(0xFFFF9800);
}

class AppSpacing {
  static const double cardRadius = 16.0;
  static const double cardPadding = 16.0;
  static const double screenPadding = 16.0;
  static const double itemSpacing = 16.0;
}

class AppTextStyles {
  static const TextStyle cardTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle cardValue = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );
  
  static const TextStyle cardSubtitle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );
} 