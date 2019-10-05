import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/transfomations/transform_size.dart';

class TransformationsPage extends StatefulWidget {
  @override
  _TransformationsPageState createState() => _TransformationsPageState();
}

class _TransformationsPageState extends State<TransformationsPage>
    with SingleTickerProviderStateMixin {
  double _width = 100;
  double _height = 50;

  // animations
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 750), vsync: this);
    _animation = Tween<double>(begin: -50.0, end: 0)
        .animate(CurvedAnimation(curve: Curves.easeIn, parent: _controller));
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // transformPosition(),
        TransformSize(),
      ],
    );
  }

  Widget transformPosition() {
    return Column(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _controller.forward();
          },
          child: Container(
            height: _height,
            width: _width,
            color: Colors.blueGrey[800],
            child: Center(
              child: Text(
                'Play'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform(
            transform: Matrix4.translationValues(0, _animation.value, 0),
            child: IgnorePointer(
              child: Container(
                height: _height,
                width: _width,
                color: Colors.red[300].withOpacity(.3),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            _controller.reverse();
          },
          child: Container(
            height: _height,
            width: _width,
            color: Colors.blue[700],
            child: Center(
              child: Text(
                'Reverse'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
