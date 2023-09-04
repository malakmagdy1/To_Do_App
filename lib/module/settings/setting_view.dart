import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/module/settings/setting_providar.dart';
import 'package:to_do/tasks_list/widgts/ThemeBottomSheet.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: provider.isDark() ? Colors.black : Colors.white,
      body: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: mediaQuery.width * 0.8,
              height: mediaQuery.height * 0.05,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                    color: provider.isDark()
                        ? Color(0xFF4851E5)
                        : Color(0xFF823F8D),
                    width: 3),
              ),
              child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => ThemeBottomSheet());
                  },
                  child: Text("Mode",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: provider.isDark() ? Colors.white : Colors.black,
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
