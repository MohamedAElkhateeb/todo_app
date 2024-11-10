import 'package:flutter/material.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/dart_ex.dart';

class AddTaskBottomSheet extends StatelessWidget {
  const AddTaskBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime selectedDate= DateTime.now() ;
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.45,
      padding: EdgeInsets.all(12),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text("Add New Task",
            style: LightAppStyle.bottomSheetTitle, textAlign: TextAlign.center),
        SizedBox(height: 8),
        TextFormField(
            decoration: InputDecoration(
                hintText: "enter your title", hintStyle: LightAppStyle.hint)),
        SizedBox(height: 8),
        TextFormField(
            decoration: InputDecoration(
                hintText: "enter your task description",
                hintStyle: LightAppStyle.hint)),
        SizedBox(height: 8),
        Text("Select date", style: LightAppStyle.date),
        InkWell(
            onTap: () {
              showTaskDate(context);
            },
            child: Text( selectedDate.toFormattedDate,
                textAlign: TextAlign.center, style: LightAppStyle.hint)),
        Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: Text(
            "Add Task",
          ),
        )
      ]),
    );
  }

  static void show(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: AddTaskBottomSheet(),
      ),
    );
  }

  void showTaskDate(context) {
    showDatePicker(context: context,

        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate:DateTime.now().add(Duration(days: 365)) );
  }
}
