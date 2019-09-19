import 'dart:async';

import 'package:flutter/material.dart';

class StreamsPage extends StatefulWidget {
  @override
  _StreamsPageState createState() => _StreamsPageState();
}

class _StreamsPageState extends State<StreamsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    Future.delayed(Duration(seconds: 1), () {
      CustomRouteProvider.pushRoute(CustomRouteModel(
          child: Text(
        'Working!!!',
        key: UniqueKey(),
      )));
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder(          
      stream: CustomRouteProvider.stream,
      builder: (context, AsyncSnapshot<CustomRouteModel> snapshot) {
        if (snapshot.hasData) {
          _animationController.reset();
          _animationController.forward();
          return FadeTransition(
            opacity: _animationController,
            child: Center(
              child: snapshot.data.child,
            ),
          );
        }
        return Center(child: CircularProgressIndicator());
      },
    ));
  }
}

class CustomRouteProvider {
  static StreamController<CustomRouteModel> _controller =
      StreamController<CustomRouteModel>.broadcast();

  static StreamController<CustomRouteModel> get controller => _controller;

  static Stream<CustomRouteModel> get stream =>
      controller.stream.asBroadcastStream();

  static List<CustomRouteModel> history = [];

  static pushRoute(CustomRouteModel route, {Map<String, dynamic> args}) {
    history.add(route);
    controller.add(route);
  }
}

class CustomRouteModel {
  final Widget child;
  final Map<String, dynamic> args;

  CustomRouteModel({@required this.child, this.args});
}
