import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/config/theme/app_styles.dart';
import 'package:todo_app/core/utils/colors_manger.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({super.key});

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
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12)
            ,bottomLeft: Radius.circular(12)
            ),
            onPressed: (context) {},
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
                "Task Title",
                style: LightAppStyle.todoTitle,
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Task Description",
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
}
