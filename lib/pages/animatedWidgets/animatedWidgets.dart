import 'package:flutter/material.dart';

class AnimatedWidgetPage extends StatefulWidget {
  @override
  _AnimatedWidgetPageState createState() => _AnimatedWidgetPageState();
}

class _AnimatedWidgetPageState extends State<AnimatedWidgetPage> {
  Widget _box1 = Container(
    key: UniqueKey(),
    width: 50,
    height: 50,
    color: Colors.blueGrey[600],
  );

  Widget _box2 = Container(
    key: UniqueKey(),
    width: 100,
    height: 100,
    color: Colors.blue[200],
  );

  bool _showBox1 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: _showBox1 ? _box1 : _box2,
              duration: Duration(milliseconds: 500),
            ),
          ],
        ),
        RaisedButton(
          onPressed: () {
            setState(() {
              _showBox1 = !_showBox1;
            });
          },
          child: Text('Change'),
        )
      ],
    );
  }
}
