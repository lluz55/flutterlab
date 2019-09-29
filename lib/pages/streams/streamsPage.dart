import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/streams/random_widget.dart';

Map<String, Widget> routes = {
  '/': Text(
    'Welcome',
    key: UniqueKey(),
  ),
  '/about': Text(
    'About Page',
    key: UniqueKey(),
  )
};

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
      CustomRouteProvider.pushRoute('/');
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    CustomRouteProvider.controller.close();
    print('disposing...');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        StreamBuilder(
            stream: CustomRouteProvider.stream,
            builder: (context, AsyncSnapshot<CustomRouteModel> snapshot) {
              if (snapshot.hasData) {
                print('has data...');
                _animationController.reset();
                _animationController.forward();
                return FadeTransition(
                  opacity: _animationController,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        routes[snapshot.data.routeName],
                        RandomWidget()
                      ],
                    ),
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
        RaisedButton(
          onPressed: () {
            CustomRouteProvider.pushRoute('/about');
          },
          child: Text('About'),
        )
      ],
    );
  }
}

class CustomRouteProvider {
  static StreamController<CustomRouteModel> _controller =
      StreamController<CustomRouteModel>.broadcast();

  static StreamController<CustomRouteModel> get controller => _controller;

  static Stream<CustomRouteModel> get stream =>
      controller.stream.asBroadcastStream();

  static List<CustomRouteModel> history = [];

  static String lastRoute = '';

  static pushRoute(String routeName, {Map<String, dynamic> args}) {
    var route = CustomRouteModel(routeName: routeName, args: args);
    if (route.routeName == lastRoute) return;
    history.add(route);
    controller.add(route);
    lastRoute = routeName;
  }
}

class CustomRouteModel {
  final String routeName;
  final Map<String, dynamic> args;

  CustomRouteModel({@required this.routeName, this.args});
}
