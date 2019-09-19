import 'package:flutter/material.dart';
import 'package:flutter_lab/layouts/mainLayout.dart';
import 'package:flutter_lab/pages/home/homePage.dart';
import 'package:flutter_lab/pages/overlayTest/overlayTest.dart';
import 'package:flutter_lab/pages/semiTransparent/semiTransparentPage.dart';

class RouterBuilder extends ChangeNotifier {
  static final routes = {
    '/': (_) => MainLayout(
          HomePage(),
        ),
    '/semiTransparent': (_) => MainLayout(
          SemiTransparentPage(),
        ),
    '/overlayTest': (_) => MainLayout(
          OverlayTest(),
        )
  };
}
