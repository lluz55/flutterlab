import 'package:flutter/material.dart';
import 'package:flutter_lab/drawer/routeDrawerItem.dart';

class MainDrawer extends StatelessWidget {
  final double elevation;

  MainDrawer() : this.elevation = 10;

  MainDrawer.persistent() : this.elevation = 1;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: elevation,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Center(
                child: Text(
              'FlutterLab',
              style: TextStyle(
                  color: Colors.white60,
                  fontSize: Theme.of(context).textTheme.display1.fontSize),
            )),
          ),
          ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 8.0),
            children: <Widget>[
              RouteDrawerItem(context,
                  title: 'Borda semi-transparente',
                  description: 'ListView com borda semi transparente',
                  route: '/semiTransparent'),
              SizedBox(height: 8.0),
              RouteDrawerItem(
                context,
                title: 'Overlay',
                description: 'Testes com widgets sob outros',
                route: '/overlayTest',
              )
            ],
          )
        ],
      ),
    );
  }
}
