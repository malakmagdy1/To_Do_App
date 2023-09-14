import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:to_do/core/theme/my_theme.dart';
import 'package:to_do/tasks_list/widgts/task_iteam_widget.dart';

import '../module/settings/setting_providar.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: mediaQuery.width,
        ),
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 30)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: provider.isDark() ? Colors.white : Colors.black,
          dayColor: provider.isDark() ? Colors.white : Colors.black,
          activeDayColor: Colors.white,
          activeBackgroundDayColor:
              provider.isDark() ? Colors.amberAccent : Colors.blueAccent,
          dotsColor: Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: 'en_ISO',
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskIteamWidget(),
          ),
        )
      ],
    );
  }
}
