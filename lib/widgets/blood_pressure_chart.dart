import 'package:flutter/material.dart';
import 'dart:math';

class BloodPressureChart extends StatefulWidget {
  const BloodPressureChart({super.key});

  @override
  State<BloodPressureChart> createState() => _BloodPressureChartState();
}

class _BloodPressureChartState extends State<BloodPressureChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<int> systolic = [120, 125, 118, 122, 119, 121, 123];
  final List<int> diastolic = [80, 82, 78, 79, 77, 81, 80];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
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
          painter: _BloodPressurePainter(
            animationValue: _animation.value,
            systolic: systolic,
            diastolic: diastolic,
          ),
          child: Container(height: 100),
        );
      },
    );
  }
}

class _BloodPressurePainter extends CustomPainter {
  final double animationValue;
  final List<int> systolic;
  final List<int> diastolic;

  _BloodPressurePainter({
    required this.animationValue,
    required this.systolic,
    required this.diastolic,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final systolicPaint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final diastolicPaint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final double spacing = size.width / (systolic.length - 1);

    final systolicPath = Path();
    final diastolicPath = Path();

    for (int i = 0; i < systolic.length; i++) {
      double x = i * spacing;
      double systolicY = size.height - ((systolic[i] - 70) * 1.5) * animationValue;
      double diastolicY = size.height - ((diastolic[i] - 70) * 1.5) * animationValue;

      if (i == 0) {
        systolicPath.moveTo(x, systolicY);
        diastolicPath.moveTo(x, diastolicY);
      } else {
        systolicPath.lineTo(x, systolicY);
        diastolicPath.lineTo(x, diastolicY);
      }
    }

    canvas.drawPath(systolicPath, systolicPaint);
    canvas.drawPath(diastolicPath, diastolicPaint);
  }

  @override
  bool shouldRepaint(covariant _BloodPressurePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
