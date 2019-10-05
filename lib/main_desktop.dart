import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab/router.dart';
import 'package:flutter_lab/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        builder: (_) => ThemeBloc(),
      )
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeBloc = Provider.of<ThemeBloc>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab',
      theme: ThemeData(
        pageTransitionsTheme: themeBloc.pageTransitionsTheme(),
      ),
      initialRoute: '/',
      routes: RouterBuilder.routes,
    );
  }
}
