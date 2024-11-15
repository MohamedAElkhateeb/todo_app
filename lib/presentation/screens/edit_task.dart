import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/utils/colors_manger.dart';
import 'package:todo_app/core/utils/dart_ex.dart';
import 'package:todo_app/core/utils/routes_manger.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../config/theme/app_styles.dart';
import '../../datebase_manager/model/todo_dm.dart';
import '../../providers/theme_provider.dart';

class EditTask extends StatefulWidget {
  const EditTask({super.key, required this.todo});

  final TodoDm todo;

  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  late DateTime selectedDate;

  late TextEditingController titleController;

  late TextEditingController descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController(text: widget.todo.title);
    descriptionController =
        TextEditingController(text: widget.todo.description);
    selectedDate = widget.todo.dateTime;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title:  Text(AppLocalizations.of(context)!.appTitle)),
      body: Stack(children: [
        Container(
          color: ColorsManger.blue,
          height: MediaQuery.of(context).size.height * .1,
        ),
        Container(
          padding: REdgeInsets.all(12),
          width: double.infinity,
          margin: REdgeInsets.symmetric(horizontal: 30),
          height: MediaQuery.of(context).size.height * .8,
          decoration:  BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
                child: Text(
                  AppLocalizations.of(context)!.editTitle,
                  style: themeProvider.isLightMode()
                      ? LightAppStyle.editingTaskTitle
                      : DarkAppStyle.editingTaskTitle,
                )),
            const Spacer(
              flex: 2,
            ),

            TextFormField(
              style: themeProvider.isLightMode()
    ? LightAppStyle.controller
        : DarkAppStyle.controller,
                controller: titleController,
                decoration: InputDecoration(
                    hintText: 'This is title',
                    hintStyle: themeProvider.isLightMode()
                        ? LightAppStyle.textFieldHint
                        : DarkAppStyle.textFieldHint)),
            SizedBox(
              height: 16.h,
            ),
            TextFormField(
            style: themeProvider.isLightMode()
            ? LightAppStyle.controller
        : DarkAppStyle.controller,
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: 'Task description',
                    hintStyle:  themeProvider.isLightMode()
                        ? LightAppStyle.textFieldHint
                        : DarkAppStyle.textFieldHint)),
            SizedBox(
              height: 24.h,
            ),
            Text(
              AppLocalizations.of(context)!.selectDate,
              textAlign: TextAlign.start,
              style: themeProvider.isLightMode()
                  ? LightAppStyle.date
                  : DarkAppStyle.date,
            ),
            InkWell(
              onTap: () {
                showTaskDate(context);
              },
              child: Center(
                child: Text(
                  selectedDate.toFormattedDate,
                  style:themeProvider.isLightMode()
                      ? LightAppStyle.textFieldHint
                      : DarkAppStyle.textFieldHint,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Center(
                child: ElevatedButton(
                  onPressed: () {
                    editTaskOnFireStore(widget.todo);
                    Navigator.pushReplacementNamed(
                        context, RoutesManger.home);
                  },
                  style: ButtonStyle(
                      padding: MaterialStatePropertyAll(REdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 12,
                      )),
                      backgroundColor:
                       const MaterialStatePropertyAll(ColorsManger.blue),
                      shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))))),
                  child: Text(
                   AppLocalizations.of(context)!.saveButton,
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )),
            const Spacer(
              flex: 4,
            )
          ]),
        )
      ]),
    );
  }

  Future<void> showTaskDate(context) async {
    selectedDate = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }

  editTaskOnFireStore(TodoDm todo) async {
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection(TodoDm.collectionName);
    DocumentReference documentReference = collectionReference.doc(todo.id);
    await documentReference.update({
      'title': titleController.text,
      'description': descriptionController.text,
      'dateTime': selectedDate,
    });
  }
}