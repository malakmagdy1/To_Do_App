import 'dart:async';

import 'package:flutter/material.dart';
import 'package:to_do/layout/home_layout.dart';

class splash extends StatelessWidget {
  static const String routeName = "splash";

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacementNamed(HomeLayoutView.routeName);
    });
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/images/WhatsApp Image 2023-08-23 at 03.18.35.jpg"),
                fit: BoxFit.fill)),
      ),
    );
  }
}
