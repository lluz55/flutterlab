import 'package:flutter/material.dart';

final _statusBarHeight = 80.0;

class CustomNavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height - _statusBarHeight,
        child: Navigator(
          initialRoute: '/1',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/1':
                return MaterialPageRoute(builder: (_) => Page1());
                break;
              case '/2':
                return MaterialPageRoute(builder: (_) => Page2());
              default:
                return MaterialPageRoute(
                  builder: (_) => Container(
                    constraints: BoxConstraints(maxHeight: 100),
                    height: 200,
                    child: Center(
                      child: Text('Page not found'),
                    ),
                  ),
                );
            }
          },
        ));
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/2');
          },
          child: Text('Go to Page 2'),
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/1');
          },
          child: Text('Go to Page 1'),
        ),
      ),
    );
  }
}
