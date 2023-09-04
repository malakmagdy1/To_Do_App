import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../module/settings/setting_providar.dart';

class TaskIteamWidget extends StatelessWidget {
  const TaskIteamWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0x6BBEB5B5)),
        width: mediaQuery.width * (0.3),
        height: mediaQuery.height * (0.13),
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 60,
                    width: 3,
                    color: provider.isDark()
                        ? Color(0xFF4851E5)
                        : const Color(0xFF823F8D),
                  ),
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Task Name"),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.access_time_rounded,
                    size: 20,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              width: 55,
              height: 40,
              decoration: BoxDecoration(
                  color:
                      provider.isDark() ? Color(0xFF4851E5) : Color(0xFF823F8D),
                  borderRadius: BorderRadius.circular(14)),
              child: Icon(Icons.check, size: 40, color: Colors.white),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
