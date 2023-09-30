import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/data_base/firebase_funcions.dart';
import 'package:to_do/tasks_list/widgts/task_iteam_widget.dart';

import '../module/TaskModel.dart';
import '../module/settings/setting_providar.dart';

class TasksListView extends StatefulWidget {
  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  List<TaskModel> allTasks = [];
  DateTime selectedDate = DateUtils.dateOnly(DateTime.now());

  @override
  // void initState() {
  //   loadTask();
  //   super.initState();
  // }

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
          firstDate: DateTime.now().subtract(Duration(days: 365)),
          lastDate: DateTime.now().add(Duration(days: 365)),
          onDateSelected: (date) {
            selectedDate = DateUtils.dateOnly(date);
          },
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
        StreamBuilder(
          stream: FirebaseFunctions.getRealTimeData(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Error");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            List<TaskModel> tasksList =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];

            return Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) =>
                  TaskIteamWidget(tasksList[index]),
              itemCount: tasksList.length,
            ));
            // var taskList = snapshot.data? .docs.map((e) => e.data()).toList();
            // return Column(
            //   children: [
            //     Expanded(
            //       child: ListView.builder(
            //         itemBuilder: (context, index) => TaskIteamWidget(
            //           taskmodel: taskList![index],
            //           title: taskList[index].title ?? "",
            //           description: taskList[index].description ?? " ",
            //         ),
            //         itemCount: taskList?.length ?? 0,
            //       ),
            //     ),
            //   ],
            // );
          },
        ),
        //       FutureBuilder(
        //         future: FirebaseFunctions.getData(selectedDate),
        //         builder: (context, snapshot) {
        //           if (snapshot.hasError) {
        //             return Text("Error..........");
        //           } else if (snapshot.connectionState == ConnectionState.waiting) {
        //             return CircularProgressIndicator();
        //           }

        //        },
        // ),
      ],
    );
  }

// loadTask() {
//   FirebaseFunctions.getData().then((value) {
//     setState(() {
//       allTasks = value;
//     });
//   });
// }
}
