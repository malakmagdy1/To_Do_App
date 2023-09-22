import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
    TasksListView(),
    SettingView(),
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
          child: Icon(
            Icons.add,
            color: provider.isDark() ? Colors.black : Colors.white,
          ),
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
    var provider = Provider.of<SettingProvider>(context,
        listen: false); //add his line to appear
    showModalBottomSheet(
      context: context,
      backgroundColor: provider.isDark()
          ? AppTheme.darkTheme.canvasColor
          : AppTheme.lightTheme.bottomSheetTheme.backgroundColor,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          )),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Add New Task",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: titleController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Task name",
                  labelStyle: TextStyle(color: Colors.white),
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
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: descriptionController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: "Task Description",
                  labelStyle: TextStyle(color: Colors.white),
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
              Spacer(),
              OutlinedButton(
                onPressed: () {
                  // if (descriptionController == null) {}
                  // ;
                  // if (titleController == null) {}
                  // ;
                  TaskModel taskModal = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      isDone: false);
                  EasyLoading.show();
                  FirebaseFunctions.addTask(taskModal).then((value) {
                    //or remove .then and write await to handle future or try catch
                    EasyLoading.dismiss();
                    Navigator.pop(context);
                    showToast();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Add Task",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(width: 2.0, color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }

//   void showToast()=>Fluttertoast.showToast(
// msg:"  Added Successfully  ",
//     gravity:ToastGravity.TOP,
//     toastLength: Toast.LENGTH_LONG
//
// //   );
  void showToast() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Added Succsesfully",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.green));
  }

  void showToastFailed() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        " Failed ",
        style: TextStyle(fontSize: 25),
      ),
      backgroundColor: Colors.red,
    ));
  }
}
