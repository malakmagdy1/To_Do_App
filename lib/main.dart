import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do/layout/home_layout.dart';
import 'package:to_do/module/loading.dart';
import 'package:to_do/module/settings/setting_providar.dart';
import 'package:to_do/module/splash/splash.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); ////////////////////////////
  await Firebase.initializeApp(
    //for firebase
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
      child: const MyApp(), create: (context) => SettingProvider()));
  loading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var providar = Provider.of<SettingProvider>(context);
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: providar.themeMode,
      initialRoute: splash.routeName,
      locale: Locale(providar.currentLang),
      routes: {
        splash.routeName: (context) => splash(),
        HomeLayoutView.routeName: (context) => const HomeLayoutView(),
      },
      builder: EasyLoading.init(builder: BotToastInit()),
    );
  }
}
