import 'package:flutter/material.dart';
import 'dart:math';

class HeartRateChart extends StatefulWidget {
  const HeartRateChart({super.key});

  @override
  State<HeartRateChart> createState() => _HeartRateChartState();
}

class _HeartRateChartState extends State<HeartRateChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<int> _heartRates = [72, 75, 78, 76, 74, 77, 73];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
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
          painter: _HeartRatePainter(
            animationValue: _controller.value,
            heartRates: _heartRates,
          ),
          child: Container(height: 100),
        );
      },
    );
  }
}

class _HeartRatePainter extends CustomPainter {
  final double animationValue;
  final List<int> heartRates;

  _HeartRatePainter({
    required this.animationValue,
    required this.heartRates,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    double spacing = size.width / (heartRates.length - 1);
    double baseLine = size.height / 2;

    for (int i = 0; i < heartRates.length; i++) {
      double x = i * spacing;
      double variation = sin((animationValue + i) * pi) * 10;
      double y = baseLine - (heartRates[i] - 70) * 1.5 + variation;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _HeartRatePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
