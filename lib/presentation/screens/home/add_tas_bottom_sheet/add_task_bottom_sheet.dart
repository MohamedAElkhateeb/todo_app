import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/dart_ex.dart';
import 'package:todo_app/datebase_manager/model/todo_dm.dart';

class AddTaskBottomSheet extends StatefulWidget {
  AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();

  static Future show(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: AddTaskBottomSheet(),
      ),
    );
  }
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.45,
        padding: EdgeInsets.all(12),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text("Add New Task",
              style: LightAppStyle.bottomSheetTitle,
              textAlign: TextAlign.center),
          SizedBox(height: 8),
          TextFormField(
            controller: titleController,
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return "plz, enter task title";
                }
              },
              decoration: InputDecoration(
                  hintText: "enter your title", hintStyle: LightAppStyle.hint)),
          SizedBox(height: 8),
          TextFormField(
            controller: descriptionController,
              validator: (input) {
                if (input == null || input.trim().isEmpty) {
                  return "plz, enter task description";
                }
                if (input.length < 6) {
                  return "sorry, description should be at least 6 chars";
                }
              },
              decoration: InputDecoration(
                  hintText: "enter your task description",
                  hintStyle: LightAppStyle.hint)),
          SizedBox(height: 8),
          Text("Select date", style: LightAppStyle.date),
          InkWell(
              onTap: () {
                showTaskDate(context);
              },
              child: Text(selectedDate.toFormattedDate,
                  textAlign: TextAlign.center, style: LightAppStyle.hint)),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              addTaskFireStore();
            },
            child: Text(
              "Add Task",
            ),
          )
        ]),
      ),
    );
  }

  Future showTaskDate(context) async {
     selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)))??selectedDate;
     setState(() {

     });
  }

  void addTaskFireStore() {
    if (formKey.currentState?.validate() == false) return;
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection(TodoDm.collectionName);
    DocumentReference documentReference = collectionReference.doc();

    TodoDm todo = TodoDm(
        id: documentReference.id,
        title: titleController.text,
        dateTime: selectedDate.copyWith(
            minute: 0, hour: 0, millisecond: 0, second: 0, microsecond: 0),
        description: descriptionController.text,
        isDone: false);
    documentReference
        .set(todo.toFireStore())
        .then(
          (value) {},
        )
        .onError(
          (error, stackTrace) {},
        )
        .timeout(
      Duration(microseconds: 500),
      onTimeout: () {
        if (context.mounted) {
          Navigator.pop(context);
        }
      },
    );
  }
}
