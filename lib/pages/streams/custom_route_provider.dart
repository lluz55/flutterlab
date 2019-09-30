import 'dart:async';

import 'package:flutter/foundation.dart';

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
