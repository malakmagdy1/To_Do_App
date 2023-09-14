import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/module/TaskModel.dart';
import 'package:to_do/module/settings/setting_view.dart';
import 'package:to_do/tasks_list/tasks_list_view.dart';

import '../core/data_base/firebase_funcions.dart';
import '../core/theme/my_theme.dart';
import '../module/settings/setting_providar.dart';

class HomeLayoutView extends StatefulWidget {
  static const String routeName = "home";

  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  int selectedIndex = 0;
  List<Widget> screens = [
    const TasksListView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingProvider>(context);
    var mediaQuery = MediaQuery.of(context).size;
    Color scaffoldBackgroundColor =
        provider.isDark() ? Colors.black : Colors.white;
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        //provider.isDark() ? Colors.deepOrange : Colors.white,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: provider.isDark()
              ? AppTheme.darkTheme.appBarTheme.backgroundColor
              : AppTheme.lightTheme.appBarTheme.backgroundColor,
          toolbarHeight: mediaQuery.height * (0.15),
          title: const Text(
            "To Do list",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: screens[selectedIndex],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          elevation: 6,
          //to can add color to buttomNavigationBar
          backgroundColor: provider.isDark() ? Colors.white : Colors.black,
          onPressed: () {
            OpenTaskSheet();
          },
          shape: StadiumBorder(
              side: BorderSide(
                  color: provider.isDark() ? Colors.black : Colors.white,
                  width: 2)),
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            backgroundColor: provider.isDark()
                ? AppTheme.lightTheme.bottomNavigationBarTheme.backgroundColor
                : const Color(0xFF823F8D),
            selectedItemColor: provider.isDark()
                ? AppTheme.darkTheme.bottomNavigationBarTheme.selectedItemColor
                : AppTheme
                .lightTheme.bottomNavigationBarTheme.selectedItemColor,
            unselectedItemColor: provider.isDark()
                ? AppTheme
                .darkTheme.bottomNavigationBarTheme.unselectedItemColor
                : AppTheme
                    .lightTheme.bottomNavigationBarTheme.unselectedItemColor,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: "menu"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "setting"),
            ],
          ),
        ));
  }

  OpenTaskSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Add New Task",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Task name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: "Task Description",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    TaskModel taskModal = TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        isDone: false);
                    FirebaseFunctions.addTask(taskModal).then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Add Task"))
            ],
          ),
        );
      },
    );
  }
}
