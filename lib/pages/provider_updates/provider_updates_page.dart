import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_lab/pages/provider_updates/provider_up_test.dart';
import 'package:provider/provider.dart';

class ProviderUpdatePage extends StatefulWidget {
  @override
  _ProviderUpdatePageState createState() => _ProviderUpdatePageState();
}

class _ProviderUpdatePageState extends State<ProviderUpdatePage> {
  final rnd = Random().nextInt(1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Consumer é atualizado toda vez que alguma propriedade no Provider é alterado\n' +
              'Selector somenete é atualizado quando uma propriedade especifica é alterada',
          style: TextStyle(fontSize: 16.0),
        ),
        SizedBox(height: 30),
        buildProp('Base widget', rnd, Colors.red[400]),
        SizedBox(height: 50),
        Consumer<ProviderUpTest>(builder: (_, updates, __) {
          return buildProp('Consumer', updates.propOne, Colors.blue[400]);
        }),
        SizedBox(height: 50),
        Selector<ProviderUpTest, String>(
            selector: (_, updates) => updates.propTwo,
            builder: (_, propTwo, __) {
              return buildProp('Selector', propTwo, Colors.green[400]);
            }),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Provider.of<ProviderUpTest>(context, listen: false)
                    .changePropOne();
              },
              child: Text('Change Consumer'),
            ),
            SizedBox(width: 25.0),
            RaisedButton(
              onPressed: () {
                Provider.of<ProviderUpTest>(context, listen: false)
                    .changePropTwo();
              },
              child: Text('Change Selector'),
            )
          ],
        )
      ],
    );
  }

  Widget buildRandomChild() {
    final rnd = Random().nextInt(9999) + 9000;
    return Text("random child. $rnd ");
  }

  Widget buildProp(String prop, dynamic val, Color color) {
    final rnd = Random().nextInt(3000) + 1000;
    return Container(
      decoration: _containerDecoration(color),
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('$prop: $val', style: _textStyle),
          SizedBox(width: 50.0),
          Text('$rnd', style: _textStyle),
        ],
      ),
    );
  }

  final _textStyle = TextStyle(
    color: Colors.white,
    fontSize: 16.0,
  );

  BoxDecoration _containerDecoration(Color color) => BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
        color: color,
      );
}
