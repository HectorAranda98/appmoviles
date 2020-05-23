import 'package:flutter/material.dart';
import 'package:planets_app/gradient_app_bar.dart';
import 'package:planets_app/planet_list.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: <Widget>[
          GradientAppBar(),
          PlanetList(),
        ],
      ),
    );
  }
}
