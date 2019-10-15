import 'package:flutter/widgets.dart';

class ProviderUpTest extends ChangeNotifier {
  String propOne = "prop1";
  String propTwo = "propTwo";

  void changePropOne() {
    propOne == 'prop1' ? propOne = 'prop1.changed' : propOne = 'prop1';
    notifyListeners();
  }

  void changePropTwo() {
    propTwo == 'propTwo' ? propTwo = 'propTwo.changed' : propTwo = 'propTwo';
    notifyListeners();
  }
}
