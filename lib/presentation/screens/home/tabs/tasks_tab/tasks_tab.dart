import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/colors_manger.dart';
import 'package:todo_app/core/utils/dart_ex.dart';
import 'package:todo_app/datebase_manager/model/todo_dm.dart';
import 'package:todo_app/presentation/screens/home/tabs/tasks_tab/todo_item.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => TasksTabState();
}

class TasksTabState extends State<TasksTab> {
  DateTime calenderSelected = DateTime.now();
  List<TodoDm> todoList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTaskFromFireStore();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: ColorsManger.blue,
              height: 90.h,
            ),
            buildCalender(),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index)
            {
              return TodoItem(
              todo: todoList[index],
              onDeletedTask: () {
                getTaskFromFireStore();
              },
            );},
            itemCount: todoList.length,
          ),
        )
      ],
    );
  }

  buildCalender() {
    return EasyInfiniteDateTimeLine(
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      focusDate: calenderSelected,
      lastDate: DateTime.now().add(Duration(days: 365)),
      onDateChange: (selectedDate) {},
      itemBuilder: (context, date, isSelected, onTap) {
        return InkWell(
          onTap: () {
            calenderSelected = date;
            getTaskFromFireStore();
          },
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "${date.getDayName}",
                style: isSelected
                    ? LightAppStyle.calenderSelectedDate
                    : LightAppStyle.calenderUnSelectedDate,
              ),
              Text(
                "${date.day}",
                style: isSelected
                    ? LightAppStyle.calenderSelectedDate
                    : LightAppStyle.calenderUnSelectedDate,
              ),
            ]),
          ),
        );
      },
    );
  }

  void getTaskFromFireStore() async {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(TodoDm.collectionName);
    QuerySnapshot collectionSnapShot = await collectionReference
        .where('dateTime',
            isEqualTo: calenderSelected.copyWith(
              hour: 0,
              minute: 0,
              second: 0,
              millisecond: 0,
              microsecond: 0,
            ))
        .get();
    List<QueryDocumentSnapshot> documentSnapShot = collectionSnapShot.docs;
    todoList = documentSnapShot.map(
      (docSnapShot) {
        Map<String, dynamic> json = docSnapShot.data() as Map<String, dynamic>;
        TodoDm todo = TodoDm.fromFireStore(json);
        return todo;
      },
    ).toList();
    setState(() {

    });
    // todoList
    //     .where(
    //       (todo) =>
    //           todo.dateTime.day == calenderSelected.day &&
    //           todo.dateTime.month == calenderSelected.month &&
    //           todo.dateTime.year == calenderSelected.year,
    //     )
    // .toList();
  }
}
