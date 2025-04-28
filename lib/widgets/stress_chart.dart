import 'package:flutter/material.dart';
import 'dart:math';

class StressChart extends StatefulWidget {
  const StressChart({super.key});

  @override
  State<StressChart> createState() => _StressChartState();
}

class _StressChartState extends State<StressChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final double stressLevel = 0.7; // 70% stress

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
          painter: _StressPainter(
            animationValue: _animation.value,
            stressLevel: stressLevel,
          ),
          child: Container(height: 100),
        );
      },
    );
  }
}

class _StressPainter extends CustomPainter {
  final double animationValue;
  final double stressLevel;

  _StressPainter({
    required this.animationValue,
    required this.stressLevel,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    final stressPaint = Paint()
      ..shader = SweepGradient(
        colors: [Colors.redAccent, Colors.orangeAccent],
        startAngle: 0.0,
        endAngle: 2 * pi,
      ).createShader(Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2))
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = size.center(Offset.zero);
    final radius = size.width / 2.5;

    // Draw background circle
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw stress arc
    double sweepAngle = 2 * pi * stressLevel * animationValue;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2, sweepAngle, false, stressPaint);
  }

  @override
  bool shouldRepaint(covariant _StressPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
