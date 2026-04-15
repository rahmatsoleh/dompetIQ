import 'package:dompet_iq/theme_app.dart';
import 'package:flutter/material.dart';
import "dart:math" as math;

class SpedometerGauge extends StatefulWidget {
  final double percentage;
  const SpedometerGauge({super.key, required this.percentage});

  @override
  State<SpedometerGauge> createState() => _SpedometerGaugeState();
}

class _SpedometerGaugeState extends State<SpedometerGauge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animation = Tween<double>(
      begin: 0,
      end: widget.percentage,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void didUpdateWidget(covariant SpedometerGauge oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.percentage != widget.percentage) {
      _animation = Tween<double>(
        begin: oldWidget.percentage,
        end: widget.percentage,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!mounted) return;
  }

  @override
  void dispose() {
    _controller.stop(); // 🔥 penting
    _controller.dispose();
    super.dispose();
  }

  Color getColor(double value) {
    // if (value < 40) {
    //   return Colors.red;
    // } else if (value < 70) {
    //   return Colors.orange;
    // } else {
    //   return Colors.green;
    // }

    return petalRouge;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          if (!mounted) return const SizedBox();

          final value = _animation.value;

          return RepaintBoundary(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  size: Size(250, 250),
                  painter: GaugePainter(
                    percentage: value,
                    color: getColor(value),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Performance", style: poppinsRegular14),
                      Text("${value.toInt()}%", style: poppinsSemibold48),
                      Text("Total Balance", style: poppinsRegular14),
                      Text("12.000.000", style: poppinsSemibold32),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  final double percentage;
  final Color color;

  GaugePainter({required this.percentage, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 25.0;

    final rect = Rect.fromLTWH(0, 35, size.width, size.height);
    final startAngle = math.pi;
    final sweepAngle = math.pi * (percentage / 100);

    final backgroundPaint = Paint()
      ..color = petalFrost
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final foregroundPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, math.pi, math.pi, false, backgroundPaint);
    canvas.drawArc(rect, startAngle, sweepAngle, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant GaugePainter oldDelegate) {
    return oldDelegate.percentage != percentage || oldDelegate.color != color;
  }
}
