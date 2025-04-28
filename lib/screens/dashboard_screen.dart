import 'package:flutter/material.dart';
import '../widgets/placeholder_card.dart';
import '../widgets/heart_rate_chart.dart';
import '../widgets/steps_bar_chart.dart';
import '../widgets/sleep_chart.dart'; // 👈 Make sure this import is there!

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PulseBoard'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const PlaceholderCard(
            title: 'Heart Rate',
            icon: Icons.favorite,
            child: HeartRateChart(),
          ),
          const SizedBox(height: 16),
          const PlaceholderCard(
            title: 'Steps',
            icon: Icons.directions_walk,
            child: StepsBarChart(),
          ),
          const SizedBox(height: 16),
          const PlaceholderCard(
            title: 'Sleep',
            icon: Icons.bedtime,
            child: SleepChart(), // 👈 Correctly inserted SleepChart here
          ),
          const SizedBox(height: 16),
          const PlaceholderCard(
            title: 'Blood Pressure',
            icon: Icons.bloodtype,
          ),
          const SizedBox(height: 16),
          const PlaceholderCard(
            title: 'Stress',
            icon: Icons.self_improvement,
          ),
        ],
      ),
    );
  }
}
