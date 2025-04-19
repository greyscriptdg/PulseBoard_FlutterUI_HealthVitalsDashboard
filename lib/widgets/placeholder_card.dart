import 'package:flutter/material.dart';
import '../core/constants.dart';

class PlaceholderCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color cardColor;

  const PlaceholderCard({
    super.key,
    required this.title,
    required this.icon,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.cardPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: cardColor,
                  size: 24,
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: AppTextStyles.cardTitle,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              height: 100,
              decoration: BoxDecoration(
                color: cardColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
              ),
              child: const Center(
                child: Text(
                  'Coming Soon',
                  style: AppTextStyles.cardSubtitle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 