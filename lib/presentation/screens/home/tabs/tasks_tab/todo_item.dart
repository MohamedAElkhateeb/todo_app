import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/colors_manger.dart';
import 'package:todo_app/datebase_manager/model/todo_dm.dart';

import '../../../../../providers/theme_provider.dart';
import '../../../edit_task.dart';

class TodoItem extends StatelessWidget {
  TodoItem({super.key, required this.todo, required this.onDeletedTask});

  TodoDm todo;
  Function onDeletedTask;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Container(
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: ColorsManger.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Slidable(

        startActionPane: ActionPane(motion: BehindMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            onPressed: (context) {
              deleteTodoFromFireStore(todo);
              onDeletedTask();
            },
            backgroundColor: ColorsManger.red,
            foregroundColor: Theme.of(context)!.colorScheme.onPrimary,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
              icon: Icons.edit,
              label: 'Edit',
              backgroundColor: ColorsManger.blue,
              onPressed: (context) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditTask(todo: todo),
                    ));
              })
        ]),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context)!.colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(children: [
            Container(
              padding: EdgeInsets.all(10),
              height: 62,
              width: 4,
              decoration: BoxDecoration(
                color: ColorsManger.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(
              width: 7,
            ),
            Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                todo.title,
                style: LightAppStyle.todoTitle,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                todo.description,
                style: themeProvider.isLightMode()
                    ? LightAppStyle.taskItemDescription
                    : DarkAppStyle.taskItemDescription,
              ),
            ]),
            Spacer(),
            Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  color: ColorsManger.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.check,
                  color: ColorsManger.white,
                )),
          ]),
        ),
      ),
    );
  }

  void deleteTodoFromFireStore(TodoDm todo) async {
    CollectionReference todoCollection =
        FirebaseFirestore.instance.collection(TodoDm.collectionName);
    DocumentReference todoDoc = todoCollection.doc(todo.id);
    await todoDoc.delete();
    onDeletedTask();
  }
}
