import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Matrix4;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spinner',
      debugShowCheckedModeBanner: false,
      home: AnimateDemo(),
    );
  }
}

class AnimateDemo extends StatefulWidget {
  State createState() => new AnimateDemoState();
}

class AnimateDemoState extends State<AnimateDemo> with TickerProviderStateMixin {
  AnimationController _animationController;

  @override initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
  }

  @override dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:
          new Center(
            child: new ScaleTransition(
              scale: _animationController,
              alignment: Alignment.topRight,
              child: new Container(
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.blueAccent)
                ),
                width: 100.0,
                child: new FlutterLogo(style: FlutterLogoStyle.horizontal),
              ),
            ),
          ),
    );
  }
}

class ScaleTransition extends AnimatedWidget {
  const ScaleTransition({
    Key key,
    @required Animation<double> scale,
    this.alignment = Alignment.center,
    this.child,
  }) : assert(scale != null),
       super(key: key, listenable: scale);

  Animation<double> get scale => listenable;
  final Alignment alignment;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double scaleValue = scale.value;
    final Matrix4 transform = Matrix4.identity()
      ..scale(scaleValue, scaleValue, 1.0);
    return Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}