import 'dart:math';

import 'package:flutter/material.dart';

class RandomWidget extends StatelessWidget {
  final int _randomNumer = Random().nextInt(10000);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
          onTap: () {
            print('should rebuild...');
          },
          child: Text('Random number: $_randomNumer')),
    );
  }
}
