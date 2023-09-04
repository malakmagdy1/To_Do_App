import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/my_theme.dart';
import 'package:to_do/module/settings/setting_view.dart';
import 'package:to_do/tasks_list/tasks_list_view.dart';
import '../module/settings/setting_providar.dart';

class HomeLayoutView extends StatefulWidget {
  static const String routeName = "home";

  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
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
          onPressed: () {},
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
}
