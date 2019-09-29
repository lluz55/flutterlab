import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/animatedWidgets/animatedWidgets.dart';
import 'package:flutter_lab/pages/customRouter/customRouter.dart';
import 'package:flutter_lab/pages/overlayTest/overlayTest.dart';
import 'package:flutter_lab/pages/semiTransparent/semiTransparentPage.dart';
import 'package:flutter_lab/pages/streams/streamsPage.dart';
import 'package:flutter_lab/pages/transfomations/transformationsPage.dart';
import 'package:flutter_lab/pages/widget_updates/widgetUpdates.dart';
import 'package:flutter_lab/router.dart';

enum FeatureStatus { done, inProgress, planned }

class RouteDrawerItem extends StatefulWidget {
  final BuildContext context;
  final String title;
  final Widget route;
  final String description;
  final FeatureStatus status;
  final bool odd;

  RouteDrawerItem(
    this.context, {
    @required this.title,
    @required this.route,
    this.description = '',
    this.status = FeatureStatus.planned,
    this.odd = false,
  });

  @override
  _RouteDrawerItemState createState() => _RouteDrawerItemState();
}

class _RouteDrawerItemState extends State<RouteDrawerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // if (ModalRoute.of(context).settings.name != widget.route.) {
        //   Navigator.of(context).popAndPushNamed(widget.route);
        // }
        coldNavigator(context, widget.route);
      },
      child: Container(
        decoration: BoxDecoration(
          // border: Border(
          //     // left: BorderSide(
          //     //   color: _statusColor(widget.status),
          //     //   width: 3,
          //     // ),
          //     right: BorderSide(
          //   color: ModalRoute.of(context).settings.name == widget.route
          //       ? Colors.blueAccent
          //       : Colors.transparent,
          //   width: 3,
          // )),
          color: widget.odd ? Colors.grey[300] : Colors.grey[200],
        ),
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 8.0),
          title: Text(
            widget.title.toUpperCase(),
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.subhead.fontSize),
          ),
          subtitle: Text(widget.description),
        ),
      ),
    );
  }

  // Color _statusColor(FeatureStatus status) {
  //   Color color;
  //   switch (status) {
  //     case FeatureStatus.done:
  //       color = Colors.green;
  //       break;
  //     case FeatureStatus.inProgress:
  //       color = Colors.orangeAccent;
  //       break;
  //     case FeatureStatus.planned:
  //       color = Colors.grey[500];
  //       break;
  //     default:
  //       color = Colors.grey[800];
  //   }

  //   return color;
  // }
}

// List<RouteDrawerItemModel> drawerList = [
//   RouteDrawerItemModel('Borda semi-transparente', '/semiTransparent',
//       description: 'ListView com borda semi transparente'),
//   RouteDrawerItemModel('Overlay', '/overlayTest',
//       description: 'Testes com widgets sob outros', odd: true),
//   RouteDrawerItemModel('Animated Widget', '/animatedWidgets',
//       description: 'Troca de widgets animada'),
//   RouteDrawerItemModel('Streams', '/streamsPage',
//       description: 'Testes com streamings', odd: true),
//   RouteDrawerItemModel('Transformations', '/transformations',
//       description: 'Testes com transforms'),
//   RouteDrawerItemModel('Custom Router', '/customRouter',
//       description: 'Router View personalizado', odd: true)
// ];

List<RouteDrawerItemModel> drawerList = [
  RouteDrawerItemModel('Borda semi-transparente', SemiTransparentPage(),
      description: 'ListView com borda semi transparente'),
  RouteDrawerItemModel('Overlay', OverlayTest(),
      description: 'Testes com widgets sob outros', odd: true),
  RouteDrawerItemModel('Animated Widget', AnimatedWidgetPage(),
      description: 'Troca de widgets animada'),
  RouteDrawerItemModel('Streams', StreamsPage(),
      description: 'Testes com streamings', odd: true),
  RouteDrawerItemModel('Transformations', TransformationsPage(),
      description: 'Testes com transforms'),
  RouteDrawerItemModel('Custom Router', CustomRouter(),
      description: 'Router View personalizado', odd: true),
  RouteDrawerItemModel('Widget Updates', WidgetUpdatesPage(),
      description: 'Testes com atualização de widgets')
];

class RouteDrawerItemModel {
  final String title;
  final String description;
  final Widget route;
  final bool odd;
  final FeatureStatus status;

  RouteDrawerItemModel(this.title, this.route,
      {this.description = '',
      this.odd = false,
      this.status = FeatureStatus.planned});
}
