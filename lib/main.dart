import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:to_do/screen/homelayout.dart';
import 'package:to_do/screen/splash.dart';
import 'package:to_do/theme/my_theme.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme,
      initialRoute: Splash.routeName,
      routes: {
        Splash.routeName: (context) => Splash(),
        HomeLayout.routeName: (context) => HomeLayout(),
      },
    );
  }
}
