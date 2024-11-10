import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/colors_manger.dart';
import 'package:todo_app/core/utils/dart_ex.dart';
import 'package:todo_app/presentation/screens/home/tabs/tasks_tab/todo_item.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});
  @override
  State<TasksTab> createState() => _TasksTabState();
}
class _TasksTabState extends State<TasksTab> {
  DateTime calenderSelected = DateTime.now();



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: ColorsManger.blue,
          height: 90.h,
        ),
          Column(
            children: [
              buildCalender(),

              TodoItem(),
            ],
          ),
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
            setState(() {});
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
}
