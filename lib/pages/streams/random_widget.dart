import 'dart:math';

import 'package:flutter/material.dart';

class RandomWidget extends StatefulWidget {
  @override
  _RandomWidgetState createState() => _RandomWidgetState();
}

class _RandomWidgetState extends State<RandomWidget> {
  int _randomNumer;

  @override
  void initState() {
    _randomNumer = Random().nextInt(100000);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            setState(() {});
            print('should rebuild...');
          },
          child: Text('Random number: $_randomNumer')),
    );
  }
}
