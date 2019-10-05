import 'package:flutter/material.dart';

class CustomNavigatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      height: 100,
      child: Text('Page 1'),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Text('Page 2'),
    );
  }
}
