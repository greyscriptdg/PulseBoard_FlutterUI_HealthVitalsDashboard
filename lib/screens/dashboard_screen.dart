import 'package:flutter/material.dart';
import '../widgets/placeholder_card.dart';
import '../core/constants.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PulseBoard'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),
          children: [
            PlaceholderCard(
              title: 'Heart Rate',
              icon: Icons.favorite,
              cardColor: AppColors.heartRateColor,
            ),
            const SizedBox(height: AppSpacing.itemSpacing),
            PlaceholderCard(
              title: 'Steps',
              icon: Icons.directions_walk,
              cardColor: AppColors.stepsColor,
            ),
            const SizedBox(height: AppSpacing.itemSpacing),
            PlaceholderCard(
              title: 'Sleep',
              icon: Icons.bedtime,
              cardColor: AppColors.sleepColor,
            ),
            const SizedBox(height: AppSpacing.itemSpacing),
            PlaceholderCard(
              title: 'Blood Pressure',
              icon: Icons.favorite_border,
              cardColor: AppColors.bloodPressureColor,
            ),
            const SizedBox(height: AppSpacing.itemSpacing),
            PlaceholderCard(
              title: 'Stress',
              icon: Icons.psychology,
              cardColor: AppColors.stressColor,
            ),
          ],
        ),
      ),
    );
  }
} 