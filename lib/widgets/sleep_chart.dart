import 'package:flutter/material.dart';
import 'dart:math';

class SleepChart extends StatefulWidget {
  const SleepChart({super.key});

  @override
  State<SleepChart> createState() => _SleepChartState();
}

class _SleepChartState extends State<SleepChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _SleepPainter(animationValue: _controller.value),
          child: Container(height: 100),
        );
      },
    );
  }
}

class _SleepPainter extends CustomPainter {
  final double animationValue;

  _SleepPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();
    final double waveHeight = 20;

    for (double x = 0; x <= size.width; x++) {
      double y = size.height / 2 +
          sin((x / size.width * 2 * pi) + (animationValue * 2 * pi)) *
              waveHeight;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SleepPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
