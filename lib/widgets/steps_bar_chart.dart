import 'package:flutter/material.dart';

class StepsBarChart extends StatefulWidget {
  const StepsBarChart({super.key});

  @override
  State<StepsBarChart> createState() => _StepsBarChartState();
}

class _StepsBarChartState extends State<StepsBarChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<int> _steps = [4000, 6000, 5000, 7000, 8000, 4500, 6500];
  final int _maxSteps = 10000; // Goal

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: _StepsPainter(
            animationValue: _animation.value,
            steps: _steps,
            maxSteps: _maxSteps,
          ),
          child: Container(height: 120),
        );
      },
    );
  }
}

class _StepsPainter extends CustomPainter {
  final double animationValue;
  final List<int> steps;
  final int maxSteps;

  _StepsPainter({
    required this.animationValue,
    required this.steps,
    required this.maxSteps,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / (steps.length * 2);
    final paint = Paint()..color = Colors.greenAccent.shade400;

    for (int i = 0; i < steps.length; i++) {
      double left = i * 2 * barWidth + barWidth / 2;
      double barHeight = (steps[i] / maxSteps) * size.height * animationValue;
      double top = size.height - barHeight;

      Rect barRect = Rect.fromLTWH(left, top, barWidth, barHeight);
      canvas.drawRRect(
        RRect.fromRectAndRadius(barRect, const Radius.circular(8)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _StepsPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
