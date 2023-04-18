import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({Key? key}) : super(key: key);

  @override
  AnalogClockState createState() => AnalogClockState();
}

class AnalogClockState extends State<AnalogClock> {
  late Timer _timer;
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _dateTime = DateTime.now();
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 63,
      width: 63,
      child: CustomPaint(
        painter: _AnalogClockPainter(_dateTime),
        size: const Size.square(63),
      ),
    );
  }
}

class _AnalogClockPainter extends CustomPainter {
  final DateTime _dateTime;

  _AnalogClockPainter(this._dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width / 2, size.height / 2) - 27 / 2;

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paint);

    final hourHandPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final minuteHandPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    final secondHandPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    final double hour =
        (_dateTime.hour * pi / 6) + (_dateTime.minute * pi / 360);
    drawHand(canvas, center, hourHandPaint, radius * 0.5, hour);

    final double minute = (_dateTime.minute * pi / 30);
    drawHand(canvas, center, minuteHandPaint, radius * 0.8, minute);

    final double second = (_dateTime.second * pi / 30);
    drawHand(canvas, center, secondHandPaint, radius * 0.8, second);
  }

  void drawHand(Canvas canvas, Offset center, Paint paint, double length,
      double angle) {
    final line = Offset(
        center.dx + length * cos(angle), center.dy + length * sin(angle));
    canvas.drawLine(center, line, paint);
  }

  @override
  bool shouldRepaint(covariant _AnalogClockPainter oldDelegate) {
    return oldDelegate._dateTime != _dateTime;
  }
}
