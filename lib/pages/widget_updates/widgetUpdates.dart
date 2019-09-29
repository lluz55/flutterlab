import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetUpdatesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => ProviderUptades(),
      child: WidgetUpdatesBody(),
    );
  }
}

class ProviderUptades extends ChangeNotifier {
  int _counter = 0;
  get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}

class WidgetUpdatesBody extends StatefulWidget {
  @override
  _WidgetUpdatesBodyState createState() => _WidgetUpdatesBodyState();
}

class _WidgetUpdatesBodyState extends State<WidgetUpdatesBody> {
  int _rnd;
  int _count = 0;

  @override
  void initState() {
    _rnd = Random().nextInt(10000);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    setState(() {
      _rnd = Random().nextInt(1000);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text('Body rnd: $_rnd'),
          Text('Statefull update: $_count'),
          Consumer<ProviderUptades>(builder: (_, prov, __) {
            return Column(
              children: <Widget>[Text('Cosumer update ${prov.counter}')],
            );
          }),
          Selector<ProviderUptades, int>(
            selector: (context, select) {
              return select.counter > 10 ? select.counter : 0;
            },
            builder: (_, prov, __) => Text('Selector update ${prov}'),
          ),
          WidgetUpdateChild(),
          RaisedButton(
            child: Text('Statefull Update'.toUpperCase()),
            color: Colors.blue[600],
            textColor: Colors.white,
            onPressed: () {
              setState(() {
                _count++;
              });
            },
          ),
          RaisedButton(
            child: Text('Cosumer Update'.toUpperCase()),
            color: Colors.blue[600],
            textColor: Colors.white,
            onPressed: () {
              Provider.of<ProviderUptades>(context, listen: false).increment();
            },
          ),
          RaisedButton(
            child: Text('Reset counter'.toUpperCase()),
            color: Colors.red[600],
            textColor: Colors.white,
            onPressed: () {
              Provider.of<ProviderUptades>(context, listen: false).reset();
            },
          )
        ],
      ),
    );
  }
}

class WidgetUpdateChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Text('Child stateless random update: ${Random().nextInt(10000)}')
      ]),
    );
  }
}
