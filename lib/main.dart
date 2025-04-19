import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const PulseBoardApp());
}

class PulseBoardApp extends StatelessWidget {
  const PulseBoardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PulseBoard',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
