import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/layout/home_layout.dart';
import 'package:to_do/module/settings/setting_providar.dart';
import 'package:to_do/module/splash/splash.dart';

import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      child: const MyApp(), create: (context) => SettingProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var providar = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme:ThemeData.light(),
      themeMode: providar.themeMode,
      initialRoute: splash.routeName,
      routes: {
        splash.routeName: (context) => splash(),
        HomeLayoutView.routeName: (context) => const HomeLayoutView(),
      },
    );
  }
}
