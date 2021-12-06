import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spinner',
      debugShowCheckedModeBanner: false,
      home: Spinner(),
    );
  }
}

// Spinner widget
class Spinner extends StatefulWidget {
  @override
  _SpinnerState createState() => _SpinnerState();
}

// Spinner State
class _SpinnerState extends State<Spinner> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // control animasi dengan durasi dan diulang terus
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
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
      // container style
      child: Container(width: 100.0, height: 100.0, color: Colors.blue),
      builder: (BuildContext context, Widget child) {
        // rotasi
        return Transform.rotate(
          angle: _controller.value * 3.0 * math.pi,
          child: child,
        );
      },
    );
  }
}