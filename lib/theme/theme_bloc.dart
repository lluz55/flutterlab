import 'package:flutter/material.dart';

class ThemeModel {
  Brightness brightness;
  MaterialColor primarySwatch;
  Color primaryColor;
  Color backgroundColor;
  Color accentColor;
  Color hintColor;
  Color secondaryHeaderColor;

  ThemeModel({
    this.brightness,
    this.primarySwatch,
    this.backgroundColor,
    this.accentColor,
    this.hintColor,
    this.primaryColor,
    this.secondaryHeaderColor,
  });
}

enum themeColor {
  light,
  dark,
}

Map<String, ThemeModel> _themes = {
  'light': ThemeModel(
    brightness: Brightness.light,
    primaryColor: Colors.blue[400],
    primarySwatch: Colors.blue,
    backgroundColor: Colors.grey[100],
    secondaryHeaderColor: Colors.white,
  ),
  'dark': ThemeModel(
    brightness: Brightness.dark,
    backgroundColor: Colors.grey[800],
    primaryColor: Colors.grey[900],
  )
};

class ThemeBloc extends ChangeNotifier {
  ThemeModel _themeColor = _themes['light'];
  String _currentThemeColor = 'light';

  ThemeModel get themeColor => _themeColor;
  String get currentThemeColor => _currentThemeColor;

  void setColorTheme(String theme) {
    try {
      _themeColor = _themes[theme];
      _currentThemeColor = theme;
    } catch (e) {
      _themeColor = _themes['light'];
      _currentThemeColor = 'light';
      print('faied to retrieve theme: $e');
    }
    notifyListeners();
  }

  void changeTheme(ThemeModel newTheme) {
    _themeColor = ThemeModel(
      brightness: newTheme.brightness,
      primarySwatch: newTheme.primarySwatch,
      primaryColor: newTheme.primaryColor,
      secondaryHeaderColor: newTheme.secondaryHeaderColor,
      backgroundColor: newTheme.backgroundColor,
      accentColor: newTheme.accentColor,
      hintColor: newTheme.hintColor,
    );
    notifyListeners();
  }

  PageTransitionsTheme pageTransitionsTheme() {
    return PageTransitionsTheme(builders: {
      TargetPlatform.fuchsia: _InanimatePageTransitionsBuilder(),
      TargetPlatform.iOS: _InanimatePageTransitionsBuilder(),
      TargetPlatform.android: _InanimatePageTransitionsBuilder(),
    });
  }
}

class _InanimatePageTransitionsBuilder extends PageTransitionsBuilder {
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
