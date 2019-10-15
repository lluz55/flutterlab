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
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              padding: EdgeInsets.all(0),
              child: Center(
                  child: Text(
                'FlutterLab',
                style: TextStyle(
                    color: Colors.white60,
                    fontSize: Theme.of(context).textTheme.display1.fontSize),
              )),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(0),
              itemCount: drawerList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => RouteDrawerItem(
                context,
                routeName: drawerList[index].routeName,
                title: drawerList[index].title,
                description: drawerList[index].description,
                status: drawerList[index].status,
                odd: index % 2 == 0 ? true : false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
