import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lab/drawer/drawer.dart';
import 'package:flutter_lab/services/fcService.dart';
import 'package:flutter_lab/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatefulWidget {
  final Widget child;

  MainLayout(this.child);

  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  GlobalKey _pageKey = GlobalKey();
  Size _sizePage = Size(0, 0);
  Offset _positionPage = Offset(0, 0);

  bool _showOverlay = false;

  _updateMeasure() {
    final RenderBox renderBoxPage = _pageKey.currentContext.findRenderObject();
    final positionPage = renderBoxPage.localToGlobal(Offset.zero);
    final sizePage = renderBoxPage.size;

    setState(() {
      _sizePage = sizePage;
      _positionPage = positionPage;
    });
  }

  _afterLayout(_) {
    // _updateMeasure();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Provider.of<ThemeBloc>(context).themeColor;
    return LayoutBuilder(
      builder: (context, constrains) {
        return Scaffold(
          backgroundColor: themeColor.backgroundColor,
          appBar: AppBar(
            backgroundColor: themeColor.primaryColor,
            title: Text(
              'Main Layout',
              style: TextStyle(
                color: themeColor.secondaryHeaderColor,
              ),
            ),
          ),
          body: SafeArea(
            child: Row(
              children: <Widget>[
                constrains.maxWidth > 599
                    ? MainDrawer.persistent()
                    : SizedBox(),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        widget.child,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: constrains.maxWidth > 599 ? null : MainDrawer(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _showOverlay = true;
              final themeBloc = Provider.of<ThemeBloc>(context, listen: false);
              themeBloc.changeTheme(ThemeModel(
                backgroundColor: Colors.grey[800],
                primaryColor: Colors.grey[900],
                primarySwatch: Colors.blue,
              ));
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        );
      },
    );
  }
}
