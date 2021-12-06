import 'package:flutter/material.dart';

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
  Animation<Offset> positions;

  @override initState() {
    super.initState();
    _animationController = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat();
    positions = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 1.0))
      .animate(_animationController);
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
            child: new SlideTransition(
              position: positions,
              textDirection: TextDirection.rtl,
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

class SlideTransition extends AnimatedWidget {
  const SlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.textDirection,
    this.child,
  }) : assert(position != null),
       super(key: key, listenable: position);

  Animation<Offset> get position => listenable;

  final TextDirection textDirection;
  final bool transformHitTests;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    if (textDirection == TextDirection.rtl)
      offset = Offset(-offset.dx, offset.dy);
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}