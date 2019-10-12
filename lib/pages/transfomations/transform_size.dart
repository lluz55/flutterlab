import 'package:flutter/material.dart';

class TransformSize extends StatefulWidget {
  const TransformSize({
    Key key,
  }) : super(key: key);

  @override
  _TransformSizeState createState() => _TransformSizeState();
}

class _TransformSizeState extends State<TransformSize>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  GlobalKey _globalKey = GlobalKey();

  double _containerHeight = double.infinity;
  double _containerWidth = 150.0;

  double _topPos = 0.0;
  double _leftPos = 0.0;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween<double>(begin: 35, end: 260.0).animate(
        CurvedAnimation(curve: Curves.fastOutSlowIn, parent: _controller));
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox _renderBox = _globalKey.currentContext.findRenderObject();
      setState(() {
        _topPos = _renderBox.localToGlobal(Offset.zero).dy;
        _leftPos = _renderBox.localToGlobal(Offset.zero).dx;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - _topPos;
    double width = MediaQuery.of(context).size.width - _leftPos;
    TextStyle whiteTextStyle = TextStyle(color: Colors.white, fontSize: 16.0);

    return Container(
      key: _globalKey,
      height: height,
      width: width,
      child: Stack(
        children: <Widget>[
          AnimatedBuilder(
              animation: _animation,
              builder: (context, animatation) {
                return Container(
                  width: 260,
                  height: height,
                  color: Colors.blue[700],
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(
                            'Não preciso ser animado'.toUpperCase(),
                            style: whiteTextStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Transform(
            transform: Matrix4.translationValues(_animation.value, 0, 0),
            child: GestureDetector(
              onTap: () {
                print(DateTime.now());
              },
              child: Container(
                color: Colors.blue[400],
                height: height,
                width: width - 30,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        if (_controller.isCompleted) {
                          _controller.reverse();
                        } else {
                          _controller.forward();
                        }
                      },
                      color: Colors.white,
                      child: Text('Reverse me'),
                    ),
                    Text(
                      'Estou no final'.toUpperCase(),
                      style: whiteTextStyle,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
