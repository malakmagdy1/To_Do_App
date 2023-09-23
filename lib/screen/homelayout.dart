import 'package:flutter/material.dart';
import 'package:to_do/setting_screen/setting.dart';
import 'package:to_do/tasks_screen/tasks.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "homeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  int selectedIndex = 0;
  List<Widget> screens = [
    TasksPage(),
    Setting(),
  ];

  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(mediaQuery.height * 0.15),
        child: AppBar(
          title: Text("To Do"),
        ),
      ),
      body: screens[selectedIndex],
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 8,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "setting"),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "list")
          ],
        ),
      ),
    );
  }
}
