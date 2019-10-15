import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/provider_updates/provider_up_test.dart';
import 'package:flutter_lab/router.dart';
import 'package:flutter_lab/theme/theme_bloc.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          builder: (_) => ThemeBloc(),
        ),
        ChangeNotifierProvider(
          builder: (_) => ProviderUpTest(),
        )
      ], child: MyApp()),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeBloc = Provider.of<ThemeBloc>(context, listen: false);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Lab',
      theme: ThemeData(
        brightness: themeBloc.themeColor.brightness,
        pageTransitionsTheme: themeBloc.pageTransitionsTheme(),
      ),
      initialRoute: '/',
      routes: RouterBuilder.routes,
    );
  }
}
