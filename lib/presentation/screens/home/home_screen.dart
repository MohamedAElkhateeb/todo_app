import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_manger.dart';
import 'package:todo_app/presentation/screens/home/add_tas_bottom_sheet/add_task_bottom_sheet.dart';
import 'package:todo_app/presentation/screens/home/tabs/settings_tab.dart';
import 'package:todo_app/presentation/screens/home/tabs/tasks_tab/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [
    TasksTab(),
    SettingTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildfab(),
      appBar: AppBar(
        title: Text("ToDo list"),
      ),
      bottomNavigationBar: buildBottomNavBar(),
      body: tabs[currentIndex],
    );
  }

  Widget buildBottomNavBar() => ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
    child: BottomAppBar(
      notchMargin: 10,
      shape: CircularNotchedRectangle(),
      child: BottomNavigationBar(
              currentIndex: currentIndex,
              onTap: (tappedIndex) {
                currentIndex = tappedIndex;
                setState(() {});
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings_outlined), label: 'Settings')
              ]),
    ),
  );
  Widget buildfab() => FloatingActionButton(

    child: Icon(Icons.add),

    onPressed: () {
      AddTaskBottomSheet.show(context);
    },
  );
}
