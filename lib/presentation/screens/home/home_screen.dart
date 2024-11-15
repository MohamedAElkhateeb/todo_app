import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/colors_manger.dart';
import 'package:todo_app/presentation/screens/home/add_tas_bottom_sheet/add_task_bottom_sheet.dart';
import 'package:todo_app/presentation/screens/home/tabs/settings_tab.dart';
import 'package:todo_app/presentation/screens/home/tabs/tasks_tab/tasks_tab.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<TasksTabState> tasksTabKey = GlobalKey();
  int currentIndex = 0;
  List<Widget> tabs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabs = [
      TasksTab(key: tasksTabKey,),
      SettingTab(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildfab(),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appTitle),
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
              items: [
                BottomNavigationBarItem(icon: const Icon(Icons.list), label:  AppLocalizations.of(context)!.tasksTab),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.settings_outlined), label:  AppLocalizations.of(context)!.settingsTab)
              ]),
        ),
      );

  Widget buildfab() => FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async{
          await AddTaskBottomSheet.show(context);
          tasksTabKey.currentState?.getTaskFromFireStore();
        },
      );
}
