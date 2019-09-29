import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final double _width = 100;
final double _height = 500;

final List<Widget> _pages = [
  Container(
    key: UniqueKey(),
    color: Colors.blue[700],
    height: _height,
    width: _width,
  ),
  Container(
    key: UniqueKey(),
    color: Colors.green[700],
    height: _height,
    width: _width,
  ),
];

class CustomRouter extends StatefulWidget {
  @override
  _CustomRouterState createState() => _CustomRouterState();
}

class _CustomRouterState extends State<CustomRouter> {
  double _topPosition = 0;
  GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox _renderBox = _globalKey.currentContext.findRenderObject();
      setState(() {
        _topPosition = _renderBox.localToGlobal(Offset.zero).dy;
      });
      print(_topPosition);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _globalKey,
      height: MediaQuery.of(context).size.height - _topPosition,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey[200],
      child: ChangeNotifierProvider(
        builder: (context) => CustomRouterModel(),
        child: CustomRouterChild(),
      ),
    );
  }
}

class CustomRouterChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 500),
          transitionBuilder: (child, animation) => AnimatedBuilder(
            animation: animation,
            builder: (context, cuild) => Transform(
              transform:
                  Matrix4.translationValues(0, -50 + (animation.value * 50), 0),
              child: FadeTransition(opacity: animation, child: child),
            ),
            child: child,
          ),
          child: Provider.of<CustomRouterModel>(context, listen: false).route,
        ),
        // Provider.of<CustomRouterModel>(context).route,
        Positioned(
          left: 10,
          bottom: 10,
          child: FloatingActionButton(
            heroTag: UniqueKey(),
            onPressed: () {
              int currentRoute =
                  Provider.of<CustomRouterModel>(context).currentRoute;
              int index = currentRoute == _pages.length ? 0 : currentRoute++;
              Provider.of<CustomRouterModel>(context)
                  .push(_pages[index], current: index);
            },
            child: Icon(Icons.autorenew),
          ),
        )
      ],
    );
  }
}

class CustomRouterModel extends ChangeNotifier {
  Widget _route = SizedBox();
  Widget get route => _route;

  int currentRoute = 0;

  void push(Widget route, {int current}) {
    if (current != null) currentRoute = current;
    _route = route;
    currentRoute++;
    notifyListeners();
  }
}
