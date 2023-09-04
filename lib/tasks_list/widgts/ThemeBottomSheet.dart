import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/my_theme.dart';
import 'package:to_do/module/settings/setting_providar.dart';
import 'package:to_do/widget/selected_unselected.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // var mediaQuery=MediaQuery.of(context).size;
    var providar = Provider.of<SettingProvider>(context);
    return Container(
      color: providar.isDark()
          ? AppTheme.darkTheme.bottomSheetTheme.backgroundColor
          : AppTheme.lightTheme.bottomSheetTheme.backgroundColor,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              providar.enableLightTheme();
            },
            child: providar.isDark()
                ? UnSelectedIteam("Light")
                : SelectedIteam("Light"),
          ),
          InkWell(
            onTap: () {
              providar.enableDarkTheme();
            },
            child: providar.isDark()
                ? SelectedIteam(
                    "Dark",
                  )
                : UnSelectedIteam("Dark"),
          ),
        ],
      ),
    );
  }
}
