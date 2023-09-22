import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/data_base/firebase_funcions.dart';

import '../../module/TaskModel.dart';
import '../../module/settings/setting_providar.dart';

class TaskIteamWidget extends StatelessWidget {
  final String title;
  final String description;
  final TaskModel taskmodel;

  TaskIteamWidget({
    Key? key, // Replace super.key with Key
    required this.description,
    required this.title,
    required this.taskmodel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Slidable(
      startActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(onDismissed: () {}),
        children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {
              FirebaseFunctions.deleteTask(taskmodel);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0x6BBEB5B6)),
          // width: mediaQuery.width * (0.3),
          height: mediaQuery.height * (0.13),
          child: Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: mediaQuery.height * (0.073),
                      width: 3,
                      color: provider.isDark()
                          ? Color(0xFF4851E5)
                          : const Color(0xFF823F8D),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title),
                  SizedBox(
                    height: 10,
                  ),
                  Text(description),
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
                    color: provider.isDark()
                        ? Color(0xFF4851E5)
                        : Color(0xFF823F8D),
                    borderRadius: BorderRadius.circular(14)),
                child: Icon(Icons.check, size: 40, color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
