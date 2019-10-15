import 'package:flutter/material.dart';
import 'package:flutter_lab/layouts/mainLayout.dart';
import 'package:flutter_lab/pages/animatedWidgets/animatedWidgets.dart';
import 'package:flutter_lab/pages/customRouter/customRouter.dart';
import 'package:flutter_lab/pages/custom_navigator/custom_navigator.dart';
import 'package:flutter_lab/pages/home/homePage.dart';
import 'package:flutter_lab/pages/overlayTest/overlayTest.dart';
import 'package:flutter_lab/pages/provider_updates/provider_updates_page.dart';
import 'package:flutter_lab/pages/semiTransparent/semiTransparentPage.dart';
import 'package:flutter_lab/pages/streams/streamsPage.dart';
import 'package:flutter_lab/pages/transfomations/transformationsPage.dart';
import 'package:flutter_lab/pages/widget_updates/widgetUpdates.dart';

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
        ),
    '/animatedWidgets': (_) => MainLayout(
          AnimatedWidgetPage(),
        ),
    '/streamsPage': (_) => MainLayout(
          StreamsPage(),
        ),
    '/transformations': (_) => MainLayout(
          TransformationsPage(),
        ),
    '/widgetUpdates': (_) => MainLayout(
          WidgetUpdatesPage(),
        ),
    '/customNavigator': (_) => MainLayout(
          CustomNavigatorPage(),
        ),
    '/providerUpdates': (_) => MainLayout(
          ProviderUpdatePage(),
        )
  };
}
