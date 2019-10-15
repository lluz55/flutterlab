import 'package:flutter/material.dart';

enum FeatureStatus { done, inProgress, planned }

class RouteDrawerItem extends StatefulWidget {
  final BuildContext context;
  final String title;
  final String routeName;
  final String description;
  final FeatureStatus status;
  final bool odd;

  RouteDrawerItem(
    this.context, {
    @required this.title,
    @required this.routeName,
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
        if (ModalRoute.of(context).settings.name != widget.routeName) {
          Navigator.of(context).popAndPushNamed(widget.routeName);
        }
        // coldNavigator(context, widget.route);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              // left: BorderSide(
              //   color: _statusColor(widget.status),
              //   width: 3,
              // ),
              right: BorderSide(
            color: ModalRoute.of(context).settings.name == widget.routeName
                ? Colors.blueAccent
                : Colors.transparent,
            width: 3,
          )),
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
  RouteDrawerItemModel('Borda semi-transparente',
      routeName: '/semiTransparent',
      description: 'ListView com borda semi transparente'),
  RouteDrawerItemModel('Overlay',
      routeName: '/overlayTest',
      description: 'Testes com widgets sob outros',
      odd: true),
  RouteDrawerItemModel('Animated Widget',
      routeName: '/animatedWidgets', description: 'Troca de widgets animada'),
  RouteDrawerItemModel('Streams',
      routeName: '/streamsPage',
      description: 'Testes com streamings',
      odd: true),
  RouteDrawerItemModel('Transformations',
      routeName: '/transformations', description: 'Testes com transforms'),
  RouteDrawerItemModel('Widget Updates',
      routeName: '/widgetUpdates',
      description: 'Testes com atualização de widgets'),
  RouteDrawerItemModel('Custom Navigator',
      routeName: '/customNavigator',
      description: 'Navegador customizado',
      odd: true),
  RouteDrawerItemModel('Provider Update',
      routeName: '/providerUpdates',
      description: 'Testes de atualização de widget usando provider',
      odd: false),
];

class RouteDrawerItemModel {
  final String title;
  final String description;
  final String routeName;
  final bool odd;
  final FeatureStatus status;

  RouteDrawerItemModel(this.title,
      {this.description = '',
      this.routeName,
      this.odd = false,
      this.status = FeatureStatus.planned});
}
