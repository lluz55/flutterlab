import 'package:flutter/material.dart';

enum FeatureStatus { done, inProgress, planned }

class RouteDrawerItem extends StatefulWidget {
  final BuildContext context;
  final String title;
  final String route;
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
  String _currentRoute;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context).settings.name != widget.route) {
          setState(() => _currentRoute = ModalRoute.of(context).settings.name);
          Navigator.of(context).popAndPushNamed(widget.route);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
              left: BorderSide(
                color: _statusColor(widget.status),
                width: 3,
              ),
              right: BorderSide(
                color: ModalRoute.of(context).settings.name == widget.route
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

  Color _statusColor(FeatureStatus status) {
    Color color;
    switch (status) {
      case FeatureStatus.done:
        color = Colors.green;
        break;
      case FeatureStatus.inProgress:
        color = Colors.orangeAccent;
        break;
      case FeatureStatus.planned:
        color = Colors.grey[500];
        break;
      default:
        color = Colors.grey[800];
    }

    return color;
  }
}
