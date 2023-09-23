import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'homelayout.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  static const String routeName = "splash";

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void initState() {
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, HomeLayout.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
            "assets/images/WhatsApp Image 2023-08-23 at 03.18.35.jpg"),
      )),
    );
  }
}
