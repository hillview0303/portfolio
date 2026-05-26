import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedBlob extends StatefulWidget {
  final Color color;
  final double size;
  final Duration duration;
  final Offset startPosition;
  final Offset endPosition;

  const AnimatedBlob({
    super.key,
    required this.color,
    required this.size,
    this.duration = const Duration(seconds: 8),
    required this.startPosition,
    required this.endPosition,
  });

  @override
  State<AnimatedBlob> createState() => _AnimatedBlobState();
}

class _AnimatedBlobState extends State<AnimatedBlob>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _positionAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _positionAnimation = TweenSequence<Offset>([
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: widget.startPosition,
          end: widget.endPosition,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<Offset>(
          begin: widget.endPosition,
          end: widget.startPosition,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 1,
      ),
    ]).animate(_controller);

    _controller.repeat();
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
        return Positioned(
          left: _positionAnimation.value.dx,
          top: _positionAnimation.value.dy,
          child: CustomPaint(
            size: Size(widget.size, widget.size),
            painter: BlobPainter(
              color: widget.color,
              animationValue: _controller.value,
            ),
          ),
        );
      },
    );
  }
}

class BlobPainter extends CustomPainter {
  final Color color;
  final double animationValue;

  BlobPainter({
    required this.color,
    required this.animationValue,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 40);

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    for (int i = 0; i < 8; i++) {
      final angle = (i / 8) * 2 * math.pi;
      final wave = math.sin(animationValue * 2 * math.pi + i) * 0.2 + 1;
      final r = radius * wave;
      final x = center.dx + r * math.cos(angle);
      final y = center.dy + r * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        final prevAngle = ((i - 1) / 8) * 2 * math.pi;
        final prevWave = math.sin(animationValue * 2 * math.pi + (i - 1)) * 0.2 + 1;
        final prevR = radius * prevWave;
        final prevX = center.dx + prevR * math.cos(prevAngle);
        final prevY = center.dy + prevR * math.sin(prevAngle);

        final controlX = (prevX + x) / 2;
        final controlY = (prevY + y) / 2;

        path.quadraticBezierTo(controlX, controlY, x, y);
      }
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(BlobPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}

class BlobBackground extends StatelessWidget {
  const BlobBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Stack(
      children: [
        AnimatedBlob(
          color: Color(0xFFF2FF5B).withOpacity(0.15),
          size: 400,
          duration: Duration(seconds: 6),
          startPosition: Offset(screenSize.width * 0.1, screenSize.height * 0.2),
          endPosition: Offset(screenSize.width * 0.2, screenSize.height * 0.4),
        ),
        AnimatedBlob(
          color: Color(0xFF89FF69).withOpacity(0.12),
          size: 350,
          duration: Duration(seconds: 7),
          startPosition: Offset(screenSize.width * 0.7, screenSize.height * 0.1),
          endPosition: Offset(screenSize.width * 0.6, screenSize.height * 0.3),
        ),
        AnimatedBlob(
          color: Color(0xFFF2FF5B).withOpacity(0.1),
          size: 300,
          duration: Duration(seconds: 5),
          startPosition: Offset(screenSize.width * 0.8, screenSize.height * 0.6),
          endPosition: Offset(screenSize.width * 0.75, screenSize.height * 0.7),
        ),
        AnimatedBlob(
          color: Color(0xFF89FF69).withOpacity(0.08),
          size: 450,
          duration: Duration(seconds: 8),
          startPosition: Offset(screenSize.width * 0.3, screenSize.height * 0.7),
          endPosition: Offset(screenSize.width * 0.4, screenSize.height * 0.5),
        ),
      ],
    );
  }
}