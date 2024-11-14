import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/colors_manger.dart';
import 'package:todo_app/datebase_manager/model/todo_dm.dart';

class TodoItem extends StatelessWidget {
  TodoItem({super.key, required this.todo,required this.onDeletedTask});

  TodoDm todo;
  Function onDeletedTask;

  @override
  Widget build(BuildContext context) {
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
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ]),
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorsManger.white,
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
                style: LightAppStyle.todoDesc,
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

  void deleteTodoFromFireStore(TodoDm todo) async{
    CollectionReference todoCollection =
        FirebaseFirestore.instance.collection(TodoDm.collectionName);
    DocumentReference todoDoc = todoCollection.doc(todo.id);
    await todoDoc.delete();
    onDeletedTask();


  }
}
