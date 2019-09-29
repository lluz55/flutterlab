import 'package:flutter/material.dart';
import 'package:flutter_lab/router.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(providers: [], child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          pageTransitionsTheme: PageTransitionsTheme(
            builders: Map<TargetPlatform,
                    _InanimatePageTransitionsBuilder>.fromIterable(
                TargetPlatform.values.toList(),
                key: (dynamic k) => k,
                value: (dynamic _) => const _InanimatePageTransitionsBuilder()),
          )),
      initialRoute: '/',
      routes: RouterBuilder.routes,
    );
  }
}

class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
  const _InanimatePageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return child;
  }
}
